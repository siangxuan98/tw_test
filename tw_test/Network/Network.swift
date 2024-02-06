//
//  Network.swift
//  tw_test
//
//  Created by Naik Siang Xuan on 06/02/2024.
//

import Foundation
import Alamofire
import RxSwift
import SwiftyJSON

final class Network<T: Codable>: NSObject {
    
    func rxRequest(baseUrl: String = "base_url_here", endPoint: String, requestType: Alamofire.HTTPMethod = .post, params: [String: Any]? = nil, headers: [String: String]? = nil) -> Observable<ApiResult<T, ApiErrorMessage>> {
        
        var endPointParams: [String: Any] = [:]

        var headersParams: [String: String] = [:]

        if headers != nil {

            headersParams = headers!
        }
        
        headersParams["Content-Type"] = "application/json"
        
        if Constant.isUserLoggedIn() {
            
            headersParams["Authorization"] = [Constant.getAccessTokenType(), Constant.getAccessToken()].compactMap { $0 }.joined(separator: " ")
        }
        
        if params != nil {

            endPointParams = params!
        }
        
        print("Init rxRequest......")
        print("rxRequest URL: \(String(describing: baseUrl + endPoint))")
        print("rxRequest Header: \(String(describing: headersParams))")
        print("rxRequest Params: \(String(describing: endPointParams))")
        
        return AppSessionManager.shared.rx.request(requestType, baseUrl + endPoint, parameters: endPointParams, encoding: JSONEncoding.prettyPrinted, headers: headersParams)
            .responseData()
            .debug()
            .observeOn(MainScheduler.instance)
            .expectingObject(ofType: T.self)
            .asObservable()
        
    }
    
}

extension Observable where Element == (HTTPURLResponse, Data) {
    
    fileprivate func expectingObject<T : Codable>(ofType type: T.Type) -> Observable<ApiResult<T, ApiErrorMessage>>{
        return self.map{ (httpURLResponse, data) -> ApiResult<T, ApiErrorMessage> in
            
            let json = try? JSON(data: data)
            let jsonString = String(data: data, encoding: .utf8)
            
            print("Received Raw Data: \(String(describing: json))")
            
            switch httpURLResponse.statusCode{
            case 200 ... 299:
                // if status code is successful we can safely decode to our expected type T
                
                guard let base = try? JSONDecoder().decode(ApiErrorMessage.self, from: data) else {
//                    LWProgressHUD.showMessage1(L.common_error_mapping_data.rLocalized())
//                    AnalyticsHelper.logMappingError(jsonString: jsonString ?? "")
                    return .failure(ApiErrorMessage(msg: L.common_error_mapping_data.rLocalized(), code: 500))
                }
                
                if (base.code ?? 0) > 201 {
//                    LWProgressHUD.showMessage1(base.msg ?? "")
                    
                    return .failure(ApiErrorMessage(msg: base.msg ?? "", code: base.code ?? 500))
                } else {
                    
                    print(base.msg ?? "")

                }
                
                guard let object = try? JSONDecoder().decode(type, from: data) else {
//                    LWProgressHUD.showMessage1(L.common_error_mapping_data.rLocalized())
                    return .failure(ApiErrorMessage(msg: L.common_error_mapping_data.rLocalized(), code: 500))
                }
                
                print(object.dictionary as Any)
                return .success(object)
            default:
                // otherwise try
                var apiErrorMessage: ApiErrorMessage
                do{
                    // to decode an expected error
                    apiErrorMessage = try JSONDecoder().decode(ApiErrorMessage.self, from: data)
                    
                    var errorField: String = ""
                    var errorValue: String = ""
                    
                    if let errorMessage = try? JSONDecoder().decode(ApiErrorMessage.self, from: data) {
                        if let errors = errorMessage.errorList {
                            for (field, errorMessages) in errors {
                                print("Error for \(field):")
                                errorField = field
                                for error in errorMessages {
                                    print("- \(error)")
                                    errorValue = error
                                    apiErrorMessage = ApiErrorMessage(msg: errorValue, code: httpURLResponse.statusCode, errorKey: field)
                                }
                            }
                        }
                    }
                    
                } catch _ {
                    // or not. (this occurs if the API failed or doesn't return a handled exception)
                    apiErrorMessage = ApiErrorMessage(msg: L.common_error.rLocalized(), code: 500)
                }
                
                if apiErrorMessage.code == 500 {
//                    appDelegate.window?.rootViewController = CommonErrorViewController()
//                    AnalyticsHelper.logError(jsonString: jsonString ?? "")
//                    appDelegate.window?.makeKeyAndVisible()
                }   else if apiErrorMessage.code == 1001 {
//                    AppSessionManager.cancelAllTask()
//                    appDelegate.window?.rootViewController = SessionExpiredViewController()
//                    appDelegate.window?.makeKeyAndVisible()
                }
                
//                else if apiErrorMessage.code == 1001 && !Constant.getIsSessionExpired() {
//                    AppSessionManager.cancelAllTask()
//                    appDelegate.window?.rootViewController = SessionExpiredViewController()
//                    appDelegate.window?.makeKeyAndVisible()
//                } else if apiErrorMessage.code == 1001 && Constant.getIsSessionExpired() {
//                    //Do nothing
//                }
                
                else if apiErrorMessage.code == 1002 {
//                    LWProgressHUD.showMessage1(apiErrorMessage.msg ?? "")
//                    _ = Constant.logOut()
//                    appDelegate.logInOrOut(.logOut)
                } else {
//                    LWProgressHUD.showMessage1(apiErrorMessage.msg ?? "")
                }
                
                // added session expired checking based on flag return by Backend
                if (apiErrorMessage.expired ?? false) {
//                    LWProgressHUD.showMessage1(apiErrorMessage.msg ?? "")
                    _ = Constant.logOut()
//                    appDelegate.logInOrOut(.logOut)
                }

                return .failure(apiErrorMessage)
            }
        }
    }
}

public enum ApiResult<Value, Error> {
    case success(Value)
    case failure(Error)
    
    init(value: Value){
        self = .success(value)
    }
    
    init(error: Error){
        self = .failure(error)
    }
}

public struct ApiErrorMessage: Codable {
    var msg: String?
    //    var status: Bool?
    var code: Int?
    var expired: Bool?
    var errorList: [String: [String]]?
    var errorKey: String?
    
    init(msg: String, code: Int, errorKey: String? = "") {
        self.msg = msg
        self.code = code
        self.errorKey = errorKey
    }
    
    private enum CodingKeys: String, CodingKey {
        //        case status = "status"
        case code = "code"
        case msg = "message"
        case expired = "expired"
        case errorList = "error"
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        //        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
        msg = try values.decodeIfPresent(String.self, forKey: .msg)
        expired = try values.decodeIfPresent(Bool.self, forKey: .expired)
        errorList = try values.decodeIfPresent([String: [String]].self, forKey: .errorList)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        //        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(msg, forKey: .msg)
        try container.encodeIfPresent(expired, forKey: .expired)
        try container.encodeIfPresent(errorList, forKey: .errorList)
    }
    
}
