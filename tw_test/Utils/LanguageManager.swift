//
//  LanguageManager.swift
//  tw_test
//
//  Created by Naik Siang Xuan on 06/02/2024.
//

import Foundation
import Localize_Swift
import Rswift

public enum kLanguageType: String {
    
    case kEnglish = "en"
    case kChinese = "zh-Hans" //simplified
    case kMalay = "ms"
    
    static let allValues = [kEnglish, kChinese, kMalay]
    static let alllocalizedStr = [kEnglish, kChinese, kMalay].map { (type) -> String in
        return type.rawValue
    }
    
    func localizedStr() -> String {
        switch self {
        case .kEnglish:
            return "en"
        case .kChinese:
            return "zh-Hans"
        case .kMalay:
            return "ms"
        default:
            return "en"
        }
    }
    
    func serverLanguage() -> String {
        switch self {
        case .kEnglish:
            return "en"
        case .kChinese:
            return "cn"
        case .kMalay:
            return "bm"
        default:
            return "en"
        }
    }
    
    func codePath() -> String {
        return Bundle.main.path(forResource: "code_\(self.localizedStr())", ofType: "plist") ?? ""
    }
    
    func languageStr() -> String {
        switch self {
        case .kEnglish:
            return "English"
        case .kChinese:
            return "中文"
        case .kMalay:
            return "Bahasa Malaysia"
        default:
            return "English"
        }
    }
    
    func getDateLocale() -> Locale {
        return Locale(identifier: self.getDateLocaleCode())
    }
    
    func getDateLocaleCode() -> String {
        switch self {
        case .kEnglish:
            return "en"
        case .kChinese:
            return "zh"
        case .kMalay:
            return "ms"
        }
    }
}

class LWLanguageManager: NSObject {
    
    static let manager = LWLanguageManager()
    
    var bundle: Bundle?
    
    var selectedLanguage = kLanguageType.init(rawValue: "en")
    
    override init() {}
    
    func initConfig() {
        let language = UserDefaults.standard.string(forKey: Constant.currentLanguageKey) ?? kLanguageType.kEnglish.localizedStr()
        self.selectedLanguage = kLanguageType.init(rawValue: language)
        Localize.setCurrentLanguage(language)
    }
    
    func setCurrentLanguage(_ languageType: kLanguageType) {
        
        if languageType == self.selectedLanguage {
            return
        }
        
        LWLanguageManager.manager.selectedLanguage = languageType
        Constant.setCurrentLanguage(languageType.rawValue)
        Localize.setCurrentLanguage(languageType.rawValue)
    }
    
}

//MARK: - R.string.localizable
typealias L = R.string.localizable

extension StringResource{
    
    func rLocalized() -> String {
        return self.key.localized()
    }
    
}



