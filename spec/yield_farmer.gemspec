lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yield_farmer/version'

Gem::Specification.new do |spec|
  spec.name          = "yield_farmer"
  spec.version       = YieldFarmer::VERSION
  spec.authors       = ["mikennaji"]
  spec.email         = ["tobienaji@gmail.com"]

  spec.summary       = %q{defi rates}
  spec.description   = %q{gives lending and borrowing rates for top coins}
  spec.homepage      = "https://github.com/mikennaji/yield_farmer.git"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/mikennaji/yield_farmer.git"
  spec.metadata["changelog_uri"] = "https://github.com/mikennaji/yield_farmer/blob/master/README.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency 'nokogiri'
  
end
