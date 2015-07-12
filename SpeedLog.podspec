Pod::Spec.new do |s|
  s.name             = "SpeedLog"
  s.version          = "0.1.0"
  s.summary          = "SpeedLog - Swift fast bebug log, improves code oprimization"
  s.description      = <<-DESC
                        Spedlog can be easily disabled and remvoed for the release build.
                        This would increase code performance and enable better optimziation
                        for swift compiler
                       DESC
  s.homepage         = "https://github.com/kostiakoval/SpeedLog"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Kostiantyn Koval" => "konstantin.koval1@gmail.com" }
  s.source           = { :git => "https://github.com/kostiakoval/SpeedLog.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/kostiakoval'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'SpeedLog/*.swift'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
