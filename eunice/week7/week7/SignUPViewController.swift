//
//  SignUPViewController.swift
//  week7
//
//  Created by 김민경 on 2022/11/07.
//

import UIKit

class SignUPViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // 이름을 넣으면 비밀번호가 나오도록
    @IBAction func signupButtonDidTap(_ sender: Any) {
        guard let name = nameTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        
        // UserDefaults의 기본 클래스에 접근
        UserDefaults.standard.set(password, forKey: name) // "키" : "값"
        
        print("이름 : \(name), 비밀번호 : \(password)")
        // 회원가입이 되었을때 자동으로 화면이 나가지도록
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func cancelButtonDidTap(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
