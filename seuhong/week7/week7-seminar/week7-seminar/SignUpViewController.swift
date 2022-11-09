//
//  SignUpViewController.swift
//  week7-seminar
//
//  Created by 홍승완 on 2022/11/07.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func signUpButtonDidTap(_ sender: UIButton) {
        guard let name = nameTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        
        UserDefaults.standard.set(password, forKey: name)
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func cancelButtonDidTap(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
