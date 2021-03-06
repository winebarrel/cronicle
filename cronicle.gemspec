# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cronicle/version'

Gem::Specification.new do |spec|
  spec.name          = 'cronicle'
  spec.version       = Cronicle::VERSION
  spec.authors       = ['Genki Sugawara']
  spec.email         = ['sgwr_dts@yahoo.co.jp']
  spec.summary       = %q{It is a tool for execute script, and define cron on remote hosts.}
  spec.description   = %q{It is a tool for execute script, and define cron on remote hosts.}
  spec.homepage      = 'http://cronicle.codenize.tools/'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'sourcify', '~> 0.6.0.rc4'
  spec.add_dependency 'sshkit', '~> 1.6.1'
  spec.add_dependency 'thor'
  spec.add_dependency 'colorize'
  spec.add_dependency 'parallel'
  spec.add_dependency 'diffy'
  spec.add_dependency 'highline'
  spec.add_dependency 'unindent'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '>= 3.0.0'
  spec.add_development_dependency 'serverspec'
  spec.add_development_dependency 'rspec-instafail'
end
