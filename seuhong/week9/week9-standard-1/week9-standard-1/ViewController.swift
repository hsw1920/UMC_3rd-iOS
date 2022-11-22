//
//  ViewController.swift
//  week9-standard-1
//
//  Created by 홍승완 on 2022/11/22.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        getData()
    }
    
    func getData() {
        let url = URL(string: "http://apis.data.go.kr/3670000/ViewUseAvgPerOneList/ViewUseAvgPerOneList")!
        
        let serviceKey = "TRRzlUtB%2BqBaQsP0%2Fntgw0HJ6FUYgN0yJn738vPD78JnrxA08LSNx9rIus%2FKOB%2FWTTjo5aNb0Scb78nmHY9Wtw%3D%3D".removingPercentEncoding!
        
        let parameters: [String:String] = [
            "serviceKey" : serviceKey,
            "find_year" : "2022",
            "find_month" : "08",
        ]
        
        struct imageCodable: Codable {
            let urls : Array<String>
        }
        
        let alamo = AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default)
        alamo
            .validate(statusCode: 200..<300)
            .responseDecodable(of: DataModel.self) { response in
                switch response.result {
                case .success:
                    print(response.value!)
//                    print(response.value!.body[0].id)
//                    print(response.value!.body[0].ysYear)
//                    print(response.value!.body[0].ysMonth)
//                    print(response.value!.body[0].dongName)
//                    print(response.value!.body[0].dongCode)
//                    print(response.value!.body[0].indstLCD)
//                    print(response.value!.body[0].indstLName)
//                    print(response.value!.body[0].amtPer)
                case .failure(let err):
                    print(err)
                }
            }
        
        
    }
    
}

