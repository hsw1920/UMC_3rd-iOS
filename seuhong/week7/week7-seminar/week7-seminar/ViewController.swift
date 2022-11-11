//
//  ViewController.swift
//  week7-seminar
//
//  Created by 홍승완 on 2022/11/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginButtonDidTap(_ sender: UIButton) {
        guard let name = nameTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        if UserDefaults.standard.string(forKey: name) == nil {
            print("데이터가 없습니다.")
        } else if password != UserDefaults.standard.string(forKey: name) {
            print("비밀번호가 알맞지 않습니다.")
        } else {
            print("로그인 성공!")
        }
    }
    
    @IBAction func signUpButtonDidTap(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}

