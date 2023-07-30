import XCTest
@testable import Network
import Mocker
import Alamofire

class NetworkTests: XCTestCase {
    func testModel() {
        let configuration = URLSessionConfiguration.af.default
        configuration.protocolClasses = [MockingURLProtocol.self] + (configuration.protocolClasses ?? [])
        let sessionManager = Session(configuration: configuration)

        let apiEndpoint = URL(string: "https://api.pokemontcg.io/v1/cards?hp=gte55")!
        let requestExpectation = expectation(description: "Request should finish")

        if let path = Bundle.module.path(forResource: "response", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 200, data: [.get: data])
                mock.register()
            } catch {
                
            }
        }
        
        sessionManager
            .request(apiEndpoint)
            .responseDecodable(of: SearchResponseModel.self) { (response) in
                switch response.result {
                case .success(let json):
                    XCTAssertNotNil(json.cards)
                case .failure(_):
                    XCTAssertNil(response.error)
                }
                requestExpectation.fulfill()
            }.resume()

        wait(for: [requestExpectation], timeout: 10.0)
    }
}
