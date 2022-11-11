//
//  ViewController.swift
//  umc_week3
//
//  Created by banxzxx on 2022/10/07.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonDidTap(_ sender: Any) {
        guard let nextviewcontroller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "secondViewController") as? secondViewController else {return}
        //덧셈을 해서 다음 뷰에 넘기는 로직
        guard let firstNumber = firstTextField.text else {return}
        guard let secondNumber = secondTextField.text else {return}
        let result = Int(firstNumber)! + Int(secondNumber)!
        nextviewcontroller.resultString = String(result)
        present(nextviewcontroller, animated: true)
    }
    
    @IBAction func button2DidTap(_ sender: Any) {
        guard let nextviewcontroller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "secondViewController") as? secondViewController else {return}
        //덧셈을 해서 다음 뷰에 넘기는 로직
        guard let firstNumber = firstTextField.text else {return}
        guard let secondNumber = secondTextField.text else {return}
        let result = Int(firstNumber)! - Int(secondNumber)!
        nextviewcontroller.resultString = String(result)
        present(nextviewcontroller, animated: true)
    }
    
    @IBAction func button3DidTap(_ sender: Any) {
        guard let nextviewcontroller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "secondViewController") as? secondViewController else {return}
        //덧셈을 해서 다음 뷰에 넘기는 로직
        guard let firstNumber = firstTextField.text else {return}
        guard let secondNumber = secondTextField.text else {return}
        let result = Int(firstNumber)! / Int(secondNumber)!
        nextviewcontroller.resultString = String(result)
        present(nextviewcontroller, animated: true)
    }
    
    @IBAction func button4DidTap(_ sender: Any) {
        guard let nextviewcontroller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "secondViewController") as? secondViewController else {return}
        //덧셈을 해서 다음 뷰에 넘기는 로직
        guard let firstNumber = firstTextField.text else {return}
        guard let secondNumber = secondTextField.text else {return}
        let result = Int(firstNumber)! * Int(secondNumber)!
        nextviewcontroller.resultString = String(result)
        present(nextviewcontroller, animated: true)
    }
    
}

