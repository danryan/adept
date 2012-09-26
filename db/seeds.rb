# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

repo = Repository.create! :name => 'testrepo'

lucid = repo.distributions.create!({
  :origin            => "adept.io",
  :label             => "apt repo",
  :codename          => "lucid",
  :description       => "apt repo for lucid",
  :architecture_list => [ "amd64", "i386" ],
  :component_list    => [ "main" ]
})

precise = repo.distributions.create!({
  :origin            => "adept.io",
  :label             => "apt repo",
  :codename          => "precise",
  :description       => "apt repo for precise",
  :architecture_list => [ "amd64", "i386" ],
  :component_list    => [ "main" ]
})

Dir[File.join(Rails.root, 'spec', 'support', 'debs', '*.deb')].each do |deb|
  p = repo.packages.new :component => 'main', :file => CarrierWave::SanitizedFile.new(deb)
  p.distributions = [ lucid, precise ]
  p.save!
end
