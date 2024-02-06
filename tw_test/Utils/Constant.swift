//
//  Constant.swift
//  tw_test
//
//  Created by Naik Siang Xuan on 06/02/2024.
//

import Foundation
import UIKit

struct Constant {
    static let currentLanguageKey = "language"
    static let accessToken = "accessToken"
    static let accessTokenType = "accessTokenType"
    static let userData = "userData"
    
    static func setCurrentLanguage(_ language: String) {
        UserDefaults.standard.setValue(language, forKey: self.currentLanguageKey)
        UserDefaults.standard.synchronize()
    }
    
    static func getCurrentLanguage() -> String? {
        return UserDefaults.standard.string(forKey: self.currentLanguageKey)
    }
    
    static func setAccessToken(_ username: String) {
        UserDefaults.standard.setValue(username, forKey: self.accessToken)
        UserDefaults.standard.synchronize()
    }
    
    static func getAccessToken() -> String {
        let value = UserDefaults.standard.string(forKey: self.accessToken)
        return value ?? ""
    }
    
    static func setAccessTokenType(_ tokenType: String) {
        UserDefaults.standard.setValue(tokenType, forKey: self.accessTokenType)
        UserDefaults.standard.synchronize()
    }
    
    static func getAccessTokenType() -> String {
        let value = UserDefaults.standard.string(forKey: self.accessTokenType)
        return value ?? ""
    }
    
    // TODO
    static func setUser(_ userData: String) {
        UserDefaults.standard.setValue(userData, forKey: self.userData)
        UserDefaults.standard.synchronize()
    }
    
    static func isUserLoggedIn() -> Bool {

        if !getAccessToken().isEmpty {
            
            return true
        }
        
        return false
    }
    
    static func logOut() -> Bool {
        
        print("Clearing User Data......")
        
        self.setAccessToken("")
        self.setAccessTokenType("")
        
//        self.setUsername("")
//        self.setUserPassword("")
//        self.setEmployeeID(0)
//        self.setEmployerID(0)
//        self.setCompanyID(0)
//        self.setLocationID(0)
//        self.setLocation("")
//        self.setIsSuperior(false)
//        self.setUserFullname("")
        
        return !self.isUserLoggedIn()
    }
    
    // Font
    let poppinsRegular: String = "Poppins-Regular"
    let poppinsMedium: String = "Poppins-Medium"
    let poppinsSemiBold: String = "Poppins-SemiBold"
    let poppinsBold: String = "Poppins-Bold"
    let poppinsLightItalic: String = "Poppins-Light-Italic"
    
}

struct ScreenSize
{
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct DeviceType
{
    static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_5_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH <= 568.0
    static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPHONE_X          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 812.0
    static let IS_IPHONE_XMAX       = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 896.0
    static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH >= 1024.0
    static let IS_IPAD_12_9          = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1366.0
    static let IS_IPAD_11          = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1194.0
    static let IS_IPAD_10_5          = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1112.0
    static let IS_IPAD_9_7          = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
    static let IS_IPAD_MINI          = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
}
