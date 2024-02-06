//
//  MyConfig.swift
//  tw_test
//
//  Created by Naik Siang Xuan on 06/02/2024.
//

import Foundation

class MyConfig: ObservableObject {
    
    let targetName = Bundle.main.object(forInfoDictionaryKey: "CFBundleExecutable") as? String
    
    var apiUrl: String {
        return getApiUrl()
    }
    
    func getApiUrl() -> String {
        var apiUrl: String
        
        switch targetName {
        case "tw_test_staging":
            apiUrl = ""
        case "tw_test_production":
            apiUrl = ""
        default:
            apiUrl = ""
        }
        
        return apiUrl
    }
}
