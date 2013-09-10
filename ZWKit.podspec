Pod::Spec.new do |s|
  s.name         = 'ZWKit'
  s.version      = '0.0.3'
  s.summary      = 'Loose collection of classes and functions'
  s.license      = 'MIT'
  s.homepage     = 'https://github.com/zachwaugh/ZWKit'
  s.author       = {'Zach Waugh' => 'zwaugh@gmail.com'}
  s.source       = {:git => 'https://github.com/zachwaugh/ZWKit.git'}
  s.source_files = 'lib/*.{h,m}'
  s.requires_arc = true
end
