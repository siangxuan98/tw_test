//
//  BaseOperation.swift
//  tw_test
//

import Foundation
import Alamofire
import RxAlamofire

struct AppSessionManager {
    
    static let shared: SessionManager = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30
//        config.httpAdditionalHeaders = [
////            "version" : Constant.currentVersion,
////            "mobileType": "ios",
////            "Authorization" : Constant.authorizationKey,
////            "language" : LWLanguageManager.manager.selectedLanguage?.serverLanguage() ?? "en"
//            "Accept": "application/json",
//            "Content_type" : "application/json"
//        ]
        let manager = Alamofire.SessionManager(configuration: config)
        return manager
    }()
    
    static func cancelAllTask() {
        let sessionManager = AppSessionManager.shared
        sessionManager.session.getTasksWithCompletionHandler { (dataTasks, uploadTasks, downloadTasks) in
            dataTasks.forEach({ $0.cancel() })
            uploadTasks.forEach({ $0.cancel() })
            downloadTasks.forEach({ $0.cancel() })
        }
    }
}
