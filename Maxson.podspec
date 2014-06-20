Pod::Spec.new do |s|
  s.name         = "Maxson"
  s.version      = "0.5.0"
  s.summary      = "Import/export a core data managed object from/to a dictionary."
  s.homepage     = "https://github.com/beheim/Maxson"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Masashi Beheim" => "github@beheim.eu" }
  s.source       = { :git => "https://github.com/beheim/Maxson.git", :tag => s.version.to_s }
  s.source_files = "Classes"
  s.requires_arc = true
  s.frameworks = 'CoreData'
  s.dependency 'Nilus', '~> 1.1.0'
end
