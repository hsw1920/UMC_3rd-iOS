//
//  FirstVC.swift
//  week3-standard
//
//  Created by 홍승완 on 2022/10/04.
//

import UIKit

func shake(_ sender: UITextField) {
    let animation = CAKeyframeAnimation()
    animation.keyPath = "position.x"
    animation.values = [0, 5, -5, 5, -5, 0 ]
    animation.keyTimes = [0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9, 1]
    animation.duration = 0.6
    animation.isAdditive = true
    
    sender.layer.add(animation, forKey: "shake")
}

class FirstVC: UIViewController {
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var valueX: UITextField!
    @IBOutlet weak var valueY: UITextField!
    
    @IBOutlet weak var stackViewWidth: NSLayoutConstraint!
    var x = Int()
    var y = Int()
    
    var preWidth = CGFloat()
    var nextWidth = 0.0
    var isTapped: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // 이거 안해주면 FirstVC로 돌아올 때 입력했던 값이 남아있음.
    override func viewWillAppear(_ animated: Bool) {
        
        valueX.text = ""
        valueY.text = ""
        stackViewWidth.constant = 300
        
    }

    @IBAction func calcPlus(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "FirstResultVC") as? FirstResultVC else {return}
        // 추가
        if valueX.text?.isEmpty == true && valueY.text?.isEmpty == true {
            shake(valueX)
            shake(valueY)
            return
        }
        if valueX.text?.isEmpty == true {
            shake(valueX)
            return
        }
        if valueY.text?.isEmpty == true {
            shake(valueY)
            return
        }
        // 추가
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
        
        UIView.animate(
            withDuration: 0.6,
            animations: {
                self.stackViewWidth.constant = 0
                self.view.layoutIfNeeded()
            },
            completion: {_ in
                self.navigationController?.pushViewController(vc, animated: true)
            }
        )
        
    }
    
    @IBAction func calcMinus(_ sender: UIButton) {
        
        if valueX.text?.isEmpty == true && valueY.text?.isEmpty == true {
            shake(valueX)
            shake(valueY)
            return
        }
        if valueX.text?.isEmpty == true {
            shake(valueX)
            return
        }
        if valueY.text?.isEmpty == true {
            shake(valueY)
            return
        }
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
        
        UIView.animate(
            withDuration: 0.6,
            animations: {
                self.stackViewWidth.constant = 0
                self.view.layoutIfNeeded()
            },
            completion: {_ in
                self.navigationController?.pushViewController(vc, animated: true)
            }
        )
    }
    
    @IBAction func calcMultiply(_ sender: UIButton) {
        
        if valueX.text?.isEmpty == true && valueY.text?.isEmpty == true {
            shake(valueX)
            shake(valueY)
            return
        }
        if valueX.text?.isEmpty == true {
            shake(valueX)
            return
        }
        if valueY.text?.isEmpty == true {
            shake(valueY)
            return
        }
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
        
        UIView.animate(
            withDuration: 0.6,
            animations: {
                self.stackViewWidth.constant = 0
                self.view.layoutIfNeeded()
            },
            completion: {_ in
                self.navigationController?.pushViewController(vc, animated: true)
            }
        )
    }
    
    @IBAction func calcDivide(_ sender: UIButton) {
        
        if valueX.text?.isEmpty == true && valueY.text?.isEmpty == true {
            shake(valueX)
            shake(valueY)
            return
        }
        if valueX.text?.isEmpty == true {
            shake(valueX)
            return
        }
        if valueY.text?.isEmpty == true {
            shake(valueY)
            return
        }
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "FirstResultVC") as? FirstResultVC else {return}
        x = Int(valueX.text!) ?? 0
        y = Int(valueY.text!) ?? 0
        
        if y != 0 {
            vc.result = String(format: "%.2f", Double(x)/Double(y))
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
        
        UIView.animate(
            withDuration: 0.6,
            animations: {
                self.stackViewWidth.constant = 0
                self.view.layoutIfNeeded()
            },
            completion: {_ in
                self.navigationController?.pushViewController(vc, animated: true)
            }
        )
    }
    
}
