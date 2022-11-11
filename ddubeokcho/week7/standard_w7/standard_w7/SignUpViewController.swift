//
//  SignUpViewController.swift
//  standard_w7
//
//  Created by 강석호 on 2022/11/10.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func signupButtonDidTap(_ sender: Any) {
        guard let name = nameTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        UserDefaults.standard.set(password, forKey: name)
        
        print("이름: \(name), 비밀번호: \(password)")
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func cancelButtonDidTap(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
