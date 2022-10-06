//
//  ViewController.swift
//  standard_mission_w3
//
//  Created by 강석호 on 2022/10/06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftField: UITextField!
    @IBOutlet weak var rightField: UITextField!
    @IBOutlet weak var opField: UITextField!
    
    @IBAction func clac(_ sender: Any) {
        
        guard let leftText = leftField.text, let leftNum = Int(leftText) else {
            return
        }
        guard let rightText = rightField.text, let rightNum = Int(rightText) else {
            return
        }
        guard let opText = opField.text else {
            return
        }
        
        var result = 0
        
        switch opText{
        case "+":
            result = leftNum + rightNum
        case "-":
            result = leftNum - rightNum
        case "*":
            result = leftNum * rightNum
        case "/":
            result = leftNum / rightNum
        default:
            return
        }
        
        let msg = "\(leftNum) \(opText) \(rightNum) = \(result)"
        
        let alert = UIAlertController(title: "정답은!!", message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

