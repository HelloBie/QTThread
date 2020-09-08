

Pod::Spec.new do |s|


s.name         = "QTThread"
s.version      = "0.2"
s.summary      = "QTThread"


s.description  = "QTThread"

s.homepage     = "https://github.com/HelloBie/QTThread.git"

s.license      = "MIT"

s.author             = { "不不不紧张" => "1005903848@qq.com" }

s.source       = { :git => "https://github.com/HelloBie/QTThread.git", :tag => "#{s.version}" }


s.ios.frameworks = 'Foundation'

s.ios.deployment_target = '6.0' # minimum SDK with autolayout

s.source_files  = 'QTThread/QTThread/QTThread/*.{h,m}'


s.frameworks = "Foundation", "UIKit"



end
