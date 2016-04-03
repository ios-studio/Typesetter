Pod::Spec.new do |s|
  s.name         = "Typesetter"
  s.version      = "0.1.1"
  s.summary      = "A thin wrapper around dynamic type. Size your fonts across all accessibility sizes together with your designer."
  s.homepage     = "https://github.com/ios-studio/Typesetter"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Beat Richartz" => "beat.richartz@gmail.com" }
  s.source       = { :git => "https://github.com/ios-studio/Typesetter.git", :tag => s.version }

  s.ios.deployment_target = "8.0"

  s.source_files = "Typesetter/**/*.swift"
  s.requires_arc = true
end
