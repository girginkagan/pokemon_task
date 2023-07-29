//
//  BaseRequest.swift
//  
//
//  Created by Kagan Girgin on 7/29/23.
//

import Foundation
import Alamofire

public protocol BaseRequest {
    var requestMethod: RequestHttpMethod { get }
    var headers: [String: String]? { get }
    var requestBodyObject: Data? { get }
    var requestPath: String { get }
    func request() -> URLRequest
}

extension BaseRequest {
    var enviroment: Environment {
#if DEV
        return Environment.dev
#else
        return Environment.prod
#endif
    }

    public func request() -> URLRequest {
        let url: URL! = URL(string: baseUrl + requestPath)
        var request = URLRequest(url: url)
        
        if let headers = headers {
            for headerKey in headers.keys {
                request.setValue(headers[headerKey], forHTTPHeaderField: headerKey)
            }
        }
        
        switch requestMethod {
        case .get:
            request.httpMethod = "GET"
        case .post:
            request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            request.httpBody = requestBodyObject
        case .put:
            request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "PUT"
            request.httpBody = requestBodyObject
        case .delete:
            request.httpMethod = "DELETE"
        default:
            request.httpMethod = "GET"
        }
        
        return request
    }
    
    var baseUrl: String {
        switch enviroment {
        case .prod:
            return "https://api.pokemontcg.io/v1/"
        case .dev:
            return "https://api.pokemontcg.io/v1/"
        }
    }
}

public enum RequestHttpMethod {
    case get
    case post
    case patch
    case delete
    case put
}

public enum Environment {
    case prod
    case dev
}
