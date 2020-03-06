# -*- encoding: utf-8 -*-
# stub: dbscan 0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "dbscan".freeze
  s.version = "0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Matias Insaurralde".freeze, "shiguodong".freeze]
  s.date = "2013-09-11"
  s.description = "DBSCAN (Density-based spatial clustering of applications with noise) is a data clustering algorithm proposed by Martin Ester, Hans-Peter Kriegel, Jorg Sander and Xiaowei Xu.".freeze
  s.email = ["matiasbaruchinsaurralde@gmail.com".freeze, "oreatial@gmail.com".freeze]
  s.homepage = "https://github.com/matiasinsaurralde/dbscan".freeze
  s.rubygems_version = "3.0.6".freeze
  s.summary = "DBSCAN implementation.".freeze

  s.installed_by_version = "3.0.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<distance_measures>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<geocoder>.freeze, [">= 0"])
    else
      s.add_dependency(%q<distance_measures>.freeze, [">= 0"])
      s.add_dependency(%q<geocoder>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<distance_measures>.freeze, [">= 0"])
    s.add_dependency(%q<geocoder>.freeze, [">= 0"])
  end
end
