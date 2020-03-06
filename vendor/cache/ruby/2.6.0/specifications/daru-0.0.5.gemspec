# -*- encoding: utf-8 -*-
# stub: daru 0.0.5 ruby lib

Gem::Specification.new do |s|
  s.name = "daru".freeze
  s.version = "0.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Sameer Deshmukh".freeze]
  s.date = "2015-02-28"
  s.description = "Daru (Data Analysis in RUby) is a library for analysis, manipulation and visualization\nof data.\n\nDaru works with Ruby arrays and NMatrix, thus working seamlessly accross\nruby interpreters, at the same time providing speed for those who need it, while \nmaking working with data super simple and intuitive.\n".freeze
  s.email = ["sameer.deshmukh93@gmail.com".freeze]
  s.homepage = "http://github.com/v0dro/daru".freeze
  s.licenses = ["BSD-2".freeze]
  s.rubygems_version = "3.0.6".freeze
  s.summary = "Data Analysis in RUby".freeze

  s.installed_by_version = "3.0.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<awesome_print>.freeze, [">= 0"])
      s.add_development_dependency(%q<nyaplot>.freeze, [">= 0"])
      s.add_development_dependency(%q<nmatrix>.freeze, ["~> 0.1.0"])
    else
      s.add_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_dependency(%q<awesome_print>.freeze, [">= 0"])
      s.add_dependency(%q<nyaplot>.freeze, [">= 0"])
      s.add_dependency(%q<nmatrix>.freeze, ["~> 0.1.0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<awesome_print>.freeze, [">= 0"])
    s.add_dependency(%q<nyaplot>.freeze, [">= 0"])
    s.add_dependency(%q<nmatrix>.freeze, ["~> 0.1.0"])
  end
end
