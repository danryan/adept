class Package < ActiveRecord::Base
  attr_accessible :file, :component, :distributions, :distribution_ids

  belongs_to :repository
  
  has_many :distribution_packages
  has_many :distributions, through: :distribution_packages

  store :control
  store :checksums, accessors: [ :md5, :sha1, :sha256 ]

  mount_uploader :file, FileUploader

  before_create :extract_control_data

  validates :name, :component, :file,
    presence: true

  def extract_control_data
    Dir.mktmpdir do |dir|
      Dir.chdir(dir) do
        # get the cache path of our uploaded .deb
        cache_path = file.send(:cache_path)

        # extract the .deb
        deb_archive = Archive.new(cache_path)
        deb_archive.extract

        # extract the control file
        control_archive = Archive.new("control.tar.gz")
        control_archive.extract

        # parse the control file and store the results in the `control` field
        control_file = Adept::Support::Control.new('control')
        self.raw_control = control_file.raw
        self.control = control_file.parse

        source_or_package = control_file.stanza['Source'] || control_file.stanza['Package']

        # Set some additional helper attributes
        self.name = source_or_package
        self.prefix = source_or_package =~ /^lib/ ? source_or_package[0..3] : source_or_package[0]
        self.extension = file.file.extension
        self.size = File.stat(cache_path).size
        self.filename = self.file.filename
        self.architecture  = control_file.stanza['Architecture'] || 'all'
        self.kind = get_kind(file.file.extension)
        self.checksums ||= {}
        self.checksums['sha256'] = Digest::SHA2.file(cache_path).hexdigest
        self.checksums['sha1'] = Digest::SHA1.file(cache_path).hexdigest
        self.checksums['md5'] = Digest::MD5.file(cache_path).hexdigest
      end
    end
  end

  def source
    control['Source']
  end

  def package
    control['Package']
  end

  # def source_or_package
    # source || package
  # end

  # %w( md5 sha1 sha256 ).each do |chk|
    # define_method chk do
      # checksums[chk]
    # end
  # end

  def get_kind(extension)
    case extension
    when "deb"
      "binary"
    when "udeb"
      "installer"
    when "dsc"
      "source"
    end
  end

  def to_path
    path = Pathname.new('pool')
    path += component
    path += prefix
    path += name
    path += filename
    path.to_s
  end

end
