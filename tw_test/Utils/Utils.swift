import Foundation
import UIKit
import IBAnimatable

struct Colors {
    static let black = UIColor(hexString: "#000000")
    static let blackWithOpacity = UIColor(hexString: "#cc000000")
    static let primaryColor = UIColor(hexString: "#FFFFFF")
    static let greenColor = UIColor(hexString: "#00D8AF")
    static let redColor = UIColor(hexString: "#FF6C6C")
    static let grayColor = UIColor(hexString: "#CCCCCC")
    static let darkGrayColor = UIColor(hexString: "#919191")
    
    static let blueColor = UIColor(hexString: "#00E2FF")
    static let darkBlueColor = UIColor(hexString: "#00C2D5")
    static let yellowColor = UIColor(hexString: "#F5D141")
    
  
    static let textFieldDisabled = UIColor(hexString: "#A0A0A0")
    
    static let gradientStart = UIColor(hexString: "#273F60")
    static let gradientEnd = UIColor(hexString: "#000038")
    
    static let tabBarSelected = UIColor(hexString: "#00D8AF")
    static let tabBarNormal = UIColor(hexString: "#B3CCCCCC")
    
    static let borderLineColor = UIColor(hexString: "#5162A8")
    static let shadowColor = UIColor(hexString: "#000000").withAlphaComponent(0.3)
    
    static let tradeViewGradientStart = UIColor(hexString: "#5D7AA5")
    static let tradeViewGradientEnd = UIColor(hexString: "#3A5378")
    
    static let hudBackgroundColor = UIColor(hexString: "#273F60")
    
    
    static let RankingCompleteStartGradient = UIColor(hexString: "#86EDAA")
    static let RankingCompleteEndGradient = UIColor(hexString: "#4857EA")
    
    static let RankingProgressStartGradient = UIColor(hexString: "#5D7AA5")
    static let RankingProgressEndGradient = UIColor(hexString: "#273F60")
    
    static let RankingLockedStartGradient = UIColor(hexString: "#5D7AA5")
    static let RankingLockedEndGradient = UIColor(hexString: "#273F60")
    
    static let RankingVIPStartGradient = UIColor(hexString: "#FFF3A6")
    static let RankingVIPEndGradient = UIColor(hexString: "#B57E10")
    
    static let RankingVIPProgressStartGradient = UIColor(hexString: "#273F60")
    static let RankingVIPProgressEndGradient = UIColor(hexString: "#000038")
    
    
    
    
    enum Theme {
        case light
        case dark
    }
}

struct Utilities {
    
    func isStringNullOrEmpty(_ string: String?) -> Bool {
          return string == nil || string?.isEmpty == true || string == "null"
      }
}

