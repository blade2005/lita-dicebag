Gem::Specification.new do |spec|
  spec.name          = "lita-dicebag"
  spec.version       = "0.1.0"
  spec.authors       = ["Craig Davis"]
  spec.email         = ["cdavis@stoneydavis.com"]
  spec.description   = "Add a dice roller to Lita"
  spec.summary       = "Use DiceBag to make dice rolls"
  spec.homepage      = "https://github.com/syntruth/Dice-Bag"
  spec.license       = "GPLv3"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", "~> 4.0"
  spec.add_runtime_dependency "dicebag", "~> 3.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rspec", ">= 3.0.0"
end
