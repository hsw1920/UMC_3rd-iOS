//
//  FirstVC.swift
//  week3-standard
//
//  Created by 홍승완 on 2022/10/04.
//

import UIKit

class FirstVC: UIViewController {
    @IBOutlet weak var valueX: UITextField!
    @IBOutlet weak var valueY: UITextField!
    
    var x = Int()
    var y = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 이거 안해주면 FirstVC로 돌아올 때 입력했던 값이 남아있음.
    override func viewWillAppear(_ animated: Bool) {
        valueX.text = ""
        valueY.text = ""
    }

    @IBAction func calcPlus(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "FirstResultVC") as? FirstResultVC else {return}
        x = Int(valueX.text!) ?? 0
        y = Int(valueY.text!) ?? 0
        
        vc.calc = "+"
        vc.result = String(x+y)
        
        if valueX.text != "" {
            vc.xLabel = valueX.text!
        } else {vc.xLabel = "0" }
        if valueY.text != "" {
            vc.yLabel = valueY.text!
        } else {vc.yLabel = "0" }

        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func calcMinus(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "FirstResultVC") as? FirstResultVC else {return}
        x = Int(valueX.text!) ?? 0
        y = Int(valueY.text!) ?? 0
        
        vc.calc = "-"
        vc.result = String(x-y)
        
        if valueX.text != "" {
            vc.xLabel = valueX.text!
        } else {vc.xLabel = "0" }
        if valueY.text != "" {
            vc.yLabel = valueY.text!
        } else {vc.yLabel = "0" }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func calcMultiply(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "FirstResultVC") as? FirstResultVC else {return}
        x = Int(valueX.text!) ?? 0
        y = Int(valueY.text!) ?? 0
        
        vc.calc = "*"
        vc.result = String(x*y)
        
        if valueX.text != "" {
            vc.xLabel = valueX.text!
        } else {vc.xLabel = "0" }
        if valueY.text != "" {
            vc.yLabel = valueY.text!
        } else {vc.yLabel = "0" }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func calcDivide(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "FirstResultVC") as? FirstResultVC else {return}
        x = Int(valueX.text!) ?? 0
        y = Int(valueY.text!) ?? 0
        
        if y != 0 {
            vc.result = String(Double(x)/Double(y))
        } else {
            vc.result = "infinite"
        }
        vc.calc = "/"
        
        if valueX.text != "" {
            vc.xLabel = valueX.text!
        } else {vc.xLabel = "0" }
        if valueY.text != "" {
            vc.yLabel = valueY.text!
        } else {vc.yLabel = "0" }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
