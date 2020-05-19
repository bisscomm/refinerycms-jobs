# Encoding: UTF-8
$:.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = %q{refinerycms-jobs}
  s.version           = '3.0.6'
  s.summary           = %q{Ruby on Rails jobs engine for Refinery CMS.}
  s.description       = %q{Open source Ruby on Rails jobs engine designed for integration with Refinery CMS.}
  s.email             = %q{}
  s.homepage          = %q{https://github.com/refinerycms-contrib/refinerycms-jobs}
  s.authors           = ['Brice Sanchez', 'Flatterline']
  s.license           = %q{MIT}
  s.require_paths     = %w(lib)

  s.files             = `git ls-files`.split("\n")
  s.test_files        = `git ls-files -- spec/*`.split("\n")

  # Runtime dependencies
  s.add_dependency 'refinerycms-core', ['>= 3.0.0', '< 5.0']
  s.add_dependency 'refinerycms-settings', ['>= 3.0.0', '< 5.0']
  s.add_dependency 'globalize', '>= 4.0.0', '< 5.4'
  s.add_dependency 'friendly_id-globalize'
  s.add_dependency 'dragonfly', '~> 1.0'
  s.add_dependency 'filters_spam', '~> 0.2'
  s.add_dependency 'acts_as_indexed', '~> 0.8.0'
end
