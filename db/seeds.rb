# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

repo = Repository.first_or_create! :name => 'testrepo'

lucid = repo.distributions.find_or_create_by_codename({
  :origin            => "adept.io",
  :label             => "apt repo",
  :codename          => "lucid",
  :description       => "apt repo for lucid",
  :architecture_list => [ "amd64", "i386" ],
  :component_list    => [ "main", "testing" ]
})

# puts lucid.inspect

precise = repo.distributions.find_or_create_by_codename({
  :origin            => "adept.io",
  :label             => "apt repo",
  :codename          => "precise",
  :description       => "apt repo for precise",
  :architecture_list => [ "amd64", "i386" ],
  :component_list    => [ "main" ]
})

# puts precise.inspect

Dir[File.join(Rails.root, 'spec', 'support', 'debs', '*.deb')].each do |deb|
  repo.packages.create!(
    :component => 'main', 
    :file => CarrierWave::SanitizedFile.new(deb),
    :distributions => [ lucid, precise ]
  )
end
