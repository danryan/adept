class Package < ActiveRecord::Base
  attr_accessible :file, :component
  has_many :references
  has_many :distributions, :through => :references
  belongs_to :repository
  
  store :control, :accessors => [ :source, :package ]

  mount_uploader :file, FileUploader

  scope :components, lambda { |c| where(:component => c) }
  scope :letters, lambda { |l| where(:letter => l) }
  scope :names, lambda { |n| where(:name => n) }

  before_save :extract_files, :update_file_attributes

  def extract_files
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
        self.control = control_file.parse
        self.name = self.control[:source] || self.control[:package]

        pkg = source || package
        self.letter = if pkg =~ /^lib/
          pkg[0..3]
        else
          pkg[0]
        end
      end
    end
  end

  def update_file_attributes
    if file.present?
      self.original_filename = self.file.filename
    end
  end

end
