Pod::Spec.new do |s|

  s.name         = "LPCComponents"
  s.version      = "1.3.3"
  s.summary      = "LPCComponents library"
  s.description  = "LPCComponents is a library for all LPC components"
  s.homepage     = "https://github.com/LPC-Team/lpc-components-ios"
  s.license      = "MIT"
  s.author             = { "Alaeddine Ouertani" => "ouertani.alaeddine@gmail.com" }
  s.source       = { :git => "https://github.com/LPC-Team/lpc-components-ios.git", :tag => "#{s.version}" }
  s.source_files  = "Classes", "lpc-components/**/*.Swift"
  s.exclude_files = "Classes/Exclude"
  s.platform = :ios, '9.0'

end
