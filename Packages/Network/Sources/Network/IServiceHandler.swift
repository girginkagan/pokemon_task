//
//  IServiceHandler.swift
//  
//
//  Created by Kagan Girgin on 7/29/23.
//

import Alamofire

protocol IServiceHandler {
    func searchPokemons(q: String, successCompletion: @escaping(SearchResponseModel) -> Void, errorCompletion: @escaping(BaseErrorModel) -> Void)
}
