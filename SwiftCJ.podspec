
Pod::Spec.new do |s|
  s.name             = "SwiftCJ"

  s.version          = "0.1.0"
  s.summary          = "A Collection+JSON parser for Swift."
  s.description      = <<-DESC
                       A simple set of classes to parse the JSON response to a Collection+JSON call into simple objects, ported from Collection-JSON-ObjC
                       DESC
  s.homepage         = "https://github.com/adamcin/SwiftCJ"
  s.license          = 'MIT'
  s.author           = { "Mark Adamcin" => "adamcin@gmail.com" }
  s.source           = { :git => "https://github.com/adamcin/SwiftCJ.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/MarkAdamcin'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'SwiftCJ' => ['Pod/Assets/**/*.png']
  }

  s.frameworks = 'Foundation'
end
