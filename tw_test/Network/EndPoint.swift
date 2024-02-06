//
//  EndPoint.swift
//  tw_test
//
//  Created by Naik Siang Xuan on 06/02/2024.
//

import Foundation

enum CommonEndPoint: String {
    
    case checkVersion = "/v1/devices/get-app-version"
    case checkDevice = "/v1/devices/lookup"
    case bindDevice = "/v1/devices/register"
    
}

enum AuthEndPoint: String {
    
    case login = "/login"
    case logout = "/logout"
    case getCountry = "/country/get"

}


