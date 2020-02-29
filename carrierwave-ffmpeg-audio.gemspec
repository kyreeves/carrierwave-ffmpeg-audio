
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "carrierwave/ffmpeg/audio/version"

Gem::Specification.new do |spec|
  spec.name          = "carrierwave-ffmpeg-audio"
  spec.version       = CarrierWave::Ffmpeg::Audio::VERSION
  spec.authors       = ["Kyle Reeves"]
  spec.email         = ["kyreeves@icloud.com"]
  spec.summary       = %q{CarrierWave Audio Conversion}
  spec.description   = %q{FFMPEG wrapper for CarrierWave uploader that allows audio file conversion and watermarking}
  spec.homepage      = "https://github.com/kyreeves/carrierwave-ffmpeg-audio"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "carrierwave", ">= 0.10.0"

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
