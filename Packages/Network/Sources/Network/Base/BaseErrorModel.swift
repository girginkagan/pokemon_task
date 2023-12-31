//
//  BaseErrorModel.swift
//  
//
//  Created by Kagan Girgin on 7/29/23.
//

public struct BaseErrorModel: Codable {
    public var errorCode: Int?
    public let message: String?
    public let errors: [ErrorData]?
    
    public init(errorCode: Int?, message: String?, errors: [ErrorData]?) {
        self.message = message
        self.errors = errors
        self.errorCode = errorCode
    }
}

public struct ErrorData: Codable {
    public let field, message: String?
    
    public init(field: String?, message: String?) {
        self.field = field
        self.message = message
    }
}
