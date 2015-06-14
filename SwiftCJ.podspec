Pod::Spec.new do |s|
  s.name         = "SwiftCJ"
  s.version      = "0.1.0"
  s.summary      = "Collection+JSON parser for Swift."
  s.description  = "A simple set of classes to parse the JSON response to a Collection+JSON call into simple objects, ported from Collection-JSON-ObjC"
  s.homepage     = "https://github.com/adamcin/SwiftCJ"
  s.license      = 'Apache'
  s.author       = { "Mark Adamcin" => "adamcin@gmail.com" }
  s.source       = { :git => "https://github.com/adamcin/SwiftCJ.git", :tag => "SwiftCJ-0.1.0" }

  s.platform     = :ios, '7.0'

  s.source_files = 'SwiftCJ/*.swift'

  s.weak_frameworks = "Foundation"

  s.requires_arc = true
end
