# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{assert-microformats}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["George Brocklehurst"]
  s.date = %q{2009-06-01}
  s.email = %q{george.brocklehurst@gmail.com}
  s.extra_rdoc_files = ["README.markdown"]
  s.files = ["MIT-LICENSE", "README.markdown", "Rakefile", "test/assert_microformats_test.rb", "test/test_helper.rb", "lib/assert_microformats.rb", "rails/init.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/georgebrock}
  s.rdoc_options = ["--main", "README.markdown"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A Rails plugin to help with testing the presence and correctness of microformats markup}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mofo>, [">= 0.2.0"])
    else
      s.add_dependency(%q<mofo>, [">= 0.2.0"])
    end
  else
    s.add_dependency(%q<mofo>, [">= 0.2.0"])
  end
end
