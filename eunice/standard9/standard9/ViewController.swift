import UIKit
import Alamofire

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "http://apis.data.go.kr/5080000/busRouteService/getBusRoute")!
        let serviceKey = "YzTWkyxlVuAOFiFsqXRd9w%2BmByrgrDFBVIeTzWCu92kbojMchGHMfuXb%2BQlxE1et%2BpI45vHTBBMJQ7GetYqFig%3D%3D".removingPercentEncoding
        let parameter = [
            "serviceKey" : serviceKey,
            "pageNo" : "1",
            "numberOfRows" : "10"
        ]
        
        AF.request(url, method: .get, parameters: parameter)
            .responseDecodable(of: DataModel.self) { response in
                switch response.result {
                case .success(let value):
                    print(value.body)
                case .failure(let error):
                    print(error)
                }
            }
    }
}
