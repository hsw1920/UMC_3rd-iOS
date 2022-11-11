//
//  ViewController.swift
//  week3_LifeCycle
//
//  Created by 김민경 on 2022/10/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad\n")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear\n")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear\n")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear\n")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear\n")
    }

    //화면 전환
    @IBAction func buttonDidTap(_ sender: Any) {
        // typecasting (opitonal 이용)
        guard let nextViewController = UIStoryboard(name : "Main", bundle:nil).instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {return}

        
        // 덧셈을 해서 다음 뷰에 넘기는 로직
        guard let firstNumber=firstTextField.text else {return}
        
        guard let secondNumber=secondTextField.text else {return}
        
        // 덧셈 결과 담기 (optional : ! 이용, guard문을 사용하는게 더 안전하긴함)
        let result = Int(firstNumber)! + Int(secondNumber)!
        
        nextViewController.resultString = String(result) // 덧셈의 결과를 담는다.
        
        nextViewController.modalPresentationStyle = .fullScreen
        present(nextViewController, animated: true)
    }
}

