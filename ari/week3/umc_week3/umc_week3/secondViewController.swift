//
//  secondViewController.swift
//  umc_week3
//
//  Created by banxzxx on 2022/10/07.
//

import UIKit

class secondViewController: UIViewController {
    var resultString = "default 값" // 덧셈의 결과
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = resultString
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
