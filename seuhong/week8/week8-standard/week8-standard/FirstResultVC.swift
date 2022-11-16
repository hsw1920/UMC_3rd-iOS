//
//  FirstResultVC.swift
//  week3-standard
//
//  Created by 홍승완 on 2022/10/04.
//

import UIKit

class FirstResultVC: UIViewController {

    @IBOutlet weak var resultValue: UILabel!
    @IBOutlet weak var calculator: UILabel!
    @IBOutlet weak var x: UILabel!
    @IBOutlet weak var y: UILabel!
    
    var result: String = ""
    var calc = ""
    var xLabel = ""
    var yLabel = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        resultValue.text = "= \(result)"
        calculator.text = calc
        x.text = xLabel
        y.text = yLabel
    }
}
