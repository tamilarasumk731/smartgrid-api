# -*- encoding: utf-8 -*-
# stub: distance_measures 0.0.6 ruby lib
# stub: ext/core/extconf.rb ext/euclidean_distance/extconf.rb

Gem::Specification.new do |s|
  s.name = "distance_measures".freeze
  s.version = "0.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["reddavis".freeze]
  s.date = "2010-12-29"
  s.description = "A bundle of distance measures with C extensions for the slow bits".freeze
  s.email = "reddavis@gmail.com".freeze
  s.extensions = ["ext/core/extconf.rb".freeze, "ext/euclidean_distance/extconf.rb".freeze]
  s.extra_rdoc_files = ["LICENSE".freeze, "README.rdoc".freeze]
  s.files = ["LICENSE".freeze, "README.rdoc".freeze, "ext/core/extconf.rb".freeze, "ext/euclidean_distance/extconf.rb".freeze]
  s.homepage = "http://github.com/reddavis/distance_measure".freeze
  s.rubygems_version = "3.0.6".freeze
  s.summary = "A bundle of distance measures with C extensions for the slow bits".freeze

  s.installed_by_version = "3.0.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>.freeze, [">= 1.2.9"])
    else
      s.add_dependency(%q<rspec>.freeze, [">= 1.2.9"])
    end
  else
    s.add_dependency(%q<rspec>.freeze, [">= 1.2.9"])
  end
end
