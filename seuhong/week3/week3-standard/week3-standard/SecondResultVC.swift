//
//  SecondResultVC.swift
//  week3-standard
//
//  Created by 홍승완 on 2022/10/04.
//

import UIKit

protocol CalculateProtocol {
    func calcuate(x: String, y: String, calculator: String, result: String)
}

class SecondResultVC: UIViewController {
    
    var x = Int()
    var y = Int()
    @IBOutlet weak var xValue: UITextField!
    @IBOutlet weak var yValue: UITextField!
    
    var delegate: CalculateProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func calculatePlus(_ sender: UIButton) {

        x = Int(xValue.text!) ?? 0
        y = Int(yValue.text!) ?? 0
        let res = x + y
 
        delegate?.calcuate(x: xValue.text!, y: yValue.text!, calculator: "+", result: String(res))
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func calculateMinus(_ sender: UIButton) {
        x = Int(xValue.text!) ?? 0
        y = Int(yValue.text!) ?? 0
        let res = x - y
        
        delegate?.calcuate(x: xValue.text!, y: yValue.text!, calculator: "-", result: String(res))
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func calculateMultiply(_ sender: UIButton) {
        x = Int(xValue.text!) ?? 0
        y = Int(yValue.text!) ?? 0
        let res = x * y
        
        delegate?.calcuate(x: xValue.text!, y: yValue.text!, calculator: "*", result: String(res))
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func calculateDivide(_ sender: UIButton) {
        x = Int(xValue.text!) ?? 0
        y = Int(yValue.text!) ?? 0
        let res = (Double(x) / Double(y))
        
        delegate?.calcuate(x: xValue.text!, y: yValue.text!, calculator: "/", result: String(res))
        self.navigationController?.popViewController(animated: true)
    }
    
}
