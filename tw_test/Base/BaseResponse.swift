////
////  BaseResponse.swift
////  tw_test
////
//
//import Foundation
//import SwiftyJSON
//
//enum ErrorResponseType {
//    
//    case System
//    case Logic
//}
//
//public class BaseResponse : Codable {
//    
//    var status: Bool? = false
//    var accessToken: String? = ""
//    var tokenType: String? = ""
//    var timezone: String? = ""
//    var environment: String? = ""
//    var executionDuration: String? = ""
//    var logID: String? = ""
//
//    private enum CodingKeys: String, CodingKey {
//        
//        case status = "status"
//        case accessToken = "access_token"
//        case tokenType = "token_type"
//        case timezone = "timezone"
//        case environment = "environment"
//        case executionDuration = "execution_duration"
//        case logID = "log_id"
//
//    }
//    
//    init() { }
//
//    required public init(from decoder: Decoder) throws {
//        
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        
//        status = try? values.decode(Bool.self, forKey: .status)
//        accessToken = try? values.decode(String.self, forKey: .accessToken)
//        tokenType = try? values.decode(String.self, forKey: .tokenType)
//        timezone = try? values.decode(String.self, forKey: .timezone)
//        environment = try? values.decode(String.self, forKey: .environment)
//        executionDuration = try? values.decode(String.self, forKey: .executionDuration)
//        logID = try? values.decode(String.self, forKey: .logID)
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        
//        try container.encode(status, forKey: .status)
//        try container.encode(accessToken, forKey: .accessToken)
//        try container.encode(tokenType, forKey: .tokenType)
//        try container.encode(timezone, forKey: .timezone)
//        try container.encode(environment, forKey: .environment)
//        try container.encode(executionDuration, forKey: .executionDuration)
//        try container.encode(logID, forKey: .logID)
//        
//    }
//}
//
////extension String {
////    
////    public static func getErrorMessage(code:String?, message: String? = "") -> String {
////        
////        guard let code = code
////        
////        else{
////            
////            return L.common_error.rLocalized()
////        }
////        
////        let path = LWLanguageManager.manager.selectedLanguage?.codePath() ?? ""
////        
////        if let dict = NSDictionary(contentsOfFile: path) {
////            
////            if let errorStr = dict.object(forKey: code) as? String {
////                
////                return errorStr
////            }
////        }
////        
////        return "(\(code)) \(L.common_error.rLocalized())"
////    }
////}
//
