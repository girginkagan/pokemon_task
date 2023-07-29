//
//  RestClient.swift
//  
//
//  Created by Kagan Girgin on 7/29/23.
//

import Alamofire

public class RestClient: IServiceHandler {
    static let sharedInstance = RestClient()
    
    public init() {}
    
    private func sendRequest<T: Codable>(_ request: BaseRequest, _ type: T.Type, successCompletion: @escaping(T) -> Void, errorCompletion:  @escaping(BaseErrorModel) -> Void) {
        AF.request(request.request()).responseDecodable { (response: AFDataResponse<T>) in
            switch response.result {
            case .success(let json):
                if response.response!.statusCode == APIStatusCodes.success.rawValue {
                    successCompletion(json)
                } else {
                    print(response.result)
                    errorCompletion(BaseErrorModel(errorCode: response.response!.statusCode, message: "An unknown error has occured.", errors: nil))
                }
            case .failure(let error):
                errorCompletion(BaseErrorModel(errorCode: nil, message: error.localizedDescription, errors: nil))
                print(error.localizedDescription)
            }
        }
    }
    
    public func searchPokemons(q: String, successCompletion: @escaping (SearchResponseModel) -> Void, errorCompletion: @escaping (BaseErrorModel) -> Void) {
        let request = GetSearchResultRequest(hp: q)
        sendRequest(request, SearchResponseModel.self, successCompletion: successCompletion, errorCompletion: errorCompletion)
    }
}
