Pod::Spec.new do |s|
  s.name             = "SpeedLog"
  s.version          = "0.2.2"
  s.summary          = "SpeedLog - Swift fast debug logs, improves code optimization"
  s.description      = <<-DESC
                        SpeedLog can be easily disabled and removed for the release build.
                        This would increase code performance and enable better optimization
                        for swift compiler
                       DESC
  s.homepage         = "https://github.com/kostiakoval/SpeedLog"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Kostiantyn Koval" => "konstantin.koval1@gmail.com" }
  s.source           = { :git => "https://github.com/kostiakoval/SpeedLog.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/kostiakoval'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'

  s.requires_arc = true

  s.source_files = 'Source/**/*.swift'
  s.watchos.exclude_files = "Source/UIKit"

  s.pod_target_xcconfig = { 'OTHER_SWIFT_FLAGS' => '-D ENABLE_LOG' }
end
