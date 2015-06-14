Pod::Spec.new do |s|
  s.name         = "SwiftCJClient"
  s.version      = "0.1.0"
  s.summary      = "AFNetworking-based Collection+JSON HTTP client"
  s.description  = "A simple set of classes to parse the JSON response to a Collection+JSON call into simple objects, ported from Collection-JSON-ObjC"
  s.homepage     = "https://github.com/adamcin/SwiftCJ"
  s.license      = 'Apache'
  s.author       = { "Mark Adamcin" => "adamcin@gmail.com" }
  s.source       = { :git => "https://github.com/adamcin/SwiftCJ.git", :tag => "SwiftCJ-0.1.0" }

  s.platform     = :ios, '8.0'

  s.source_files = 'SwiftCJClient/*.swift'

  s.weak_frameworks = "Foundation", "Security"

  s.requires_arc = true

  s.dependency 'SwiftCJ'

  s.dependency 'BrightFutures', '~> 2.0.0-beta.1'

  s.dependency 'AFNetworking', '~> 2.0'

end
