//
//  PresentedViewController.swift
//  week3-seminar
//
//  Created by 홍승완 on 2022/10/03.
//

import UIKit

class PresentedViewController: UIViewController {
    
    // 덧셈의 결과
    var resultString = ""
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = resultString
        
    }

    @IBAction func back(_ sender: Any) {
        dismiss(animated: true)
    }
}
