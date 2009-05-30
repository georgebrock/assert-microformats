# inject assert_microformats into test::unit for test environment
if RAILS_ENV == 'test'
  require 'assert_microformats'
  Test::Unit::TestCase.send(:include, AssertMicroformats)
end
