# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{assert-microformats}
  s.version = "0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["George Brocklehurst"]
  s.date = %q{2009-05-30}
  s.description = %q{A Rails plugin to help with testing the presence and correctness of microformats markup}
  s.email = %q{george.brocklehurst@gmail.com}
  s.extra_rdoc_files = ["lib/assert_microformats.rb", "README.Markdown"]
  s.files = ["assert-microformats.gemspec", "lib/assert_microformats.rb", "Manifest", "MIT-LICENSE", "Rakefile", "README.Markdown", "test/assert_microformats_test.rb", "test/test_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/georgebrock}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Assert-microformats", "--main", "README.Markdown"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{assert-microformats}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A Rails plugin to help with testing the presence and correctness of microformats markup}
  s.test_files = ["test/assert_microformats_test.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
