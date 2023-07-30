//
//  GetSearchResultRequest.swift
//  
//
//  Created by Kagan Girgin on 7/29/23.
//

import Foundation

final class GetSearchResultRequest: BaseRequest {
    var headers: [String: String]?
    var requestBodyObject: Data?
    var requestMethod = RequestHttpMethod.get
    var requestPath: String = "cards?hp=gte"
    
    init(hp: String) {
        requestPath += hp
    }
}
