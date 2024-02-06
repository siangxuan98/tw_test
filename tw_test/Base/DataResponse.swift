//
//  DataResponse.swift
//  tw_test
//

import Foundation

public class DataResponse: Codable {

    var status: Bool? = false
    var timezone: String? = ""
    var environment: String? = ""
    var executionDuration: String? = ""
    var logID: String? = ""
    var accessToken: String? = ""
    var errorData: ErrorResponse?
    
//    var dropdownResponse: [String : [DropdownData]]?
//    var pagination: PaginationModel? = nil
//    var notificationCount: Int? = 0
//    var message: String? = ""
    
    init() { }
    
    private enum CodingKeys: String, CodingKey {
        
        case status
        case timezone
        case environment
        case executionDuration = "execution_duration"
        case logID = "log_id"
        case accessToken = "access_token"
        case errorData = "error"
        
//        case dropdownResponse = "dropdown"
//        case pagination
//        case notificationCount = "notification_count"
//        case message
        
    }

    required public init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        status = try? values.decode(Bool.self, forKey: .status)
        timezone = try? values.decode(String.self, forKey: .timezone)
        environment = try? values.decode(String.self, forKey: .environment)
        executionDuration = try? values.decode(String.self, forKey: .executionDuration)
        logID = try? values.decode(String.self, forKey: .logID)
        accessToken = try? values.decode(String.self, forKey: .accessToken)
        errorData = try? values.decode(ErrorResponse.self, forKey: .errorData)
        
//        dropdownResponse = try? values.decode([String : [DropdownData]].self, forKey: .dropdownResponse)
//        pagination = try? values.decode(PaginationModel.self, forKey: .pagination)
//        notificationCount = try? values.decode(Int.self, forKey: .notificationCount)
//        message = try? values.decode(String.self, forKey: .message)
        
    }

    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(status, forKey: .status)
        try container.encode(timezone, forKey: .timezone)
        try container.encode(environment, forKey: .environment)
        try container.encode(executionDuration, forKey: .executionDuration)
        try container.encode(logID, forKey: .logID)
        try container.encode(accessToken, forKey: .accessToken)
        try container.encode(errorData, forKey: .errorData)
        
//        try container.encode(dropdownResponse, forKey: .dropdownResponse)
//        try container.encode(pagination, forKey: .pagination)
//        try container.encode(notificationCount, forKey: .notificationCount)
//        try container.encode(message, forKey: .message)
        
    }
}

struct ErrorResponse: Codable {
    let errMessage: [String]
}

public class PaginationModel : Codable {
    
    var currentPage: Int? = 0
    var totalRows: Int? = 0
    var firstPage: Int? = 0
    var lastPage: Int? = 0
    
    var previousPage: Int? = 0
    var nextPage: Int? = 0

    private enum CodingKeys: String, CodingKey {
        
        case currentPage = "current_page"
        case totalRows = "total_rows"
        case firstPage = "first_page"
        case lastPage = "last_page"
        
        case previousPage = "prev_page"
        case nextPage = "next_page"
    }
    
    init() { }

    required public init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        currentPage = try? values.decode(Int.self, forKey: .currentPage)
        totalRows = try? values.decode(Int.self, forKey: .totalRows)
        firstPage = try? values.decode(Int.self, forKey: .firstPage)
        lastPage = try? values.decode(Int.self, forKey: .lastPage)
        
        previousPage = try? values.decode(Int.self, forKey: .previousPage)
        nextPage = try? values.decode(Int.self, forKey: .nextPage)
    }

    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(currentPage, forKey: .currentPage)
        try container.encode(totalRows, forKey: .totalRows)
        try container.encode(firstPage, forKey: .firstPage)
        try container.encode(lastPage, forKey: .lastPage)
        
        try container.encode(previousPage, forKey: .previousPage)
        try container.encode(nextPage, forKey: .nextPage)
    }
}
