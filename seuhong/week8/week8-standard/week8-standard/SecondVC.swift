//
//  SecondVC.swift
//  week3-standard
//
//  Created by 홍승완 on 2022/10/04.
//

import UIKit

class SecondVC: UIViewController {

    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var calculatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func setValueBtnTapped(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "SecondResultVC") as? SecondResultVC else {return}
        vc.delegate = self
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension SecondVC: CalculateProtocol {
    func calcuate(x: String, y: String, calculator: String, result: String) {
        if x != "" {
            xLabel.text = x
        } else { xLabel.text = "0" }
        if y != "" {
            yLabel.text = y
        } else { yLabel.text = "0" }
        
        calculatorLabel.text = calculator
        
        if calculatorLabel.text == "/" && (y == "0" || y == "") {
            answerLabel.text = "infinite"
        } else {
            answerLabel.text = result
        }
    }
}
