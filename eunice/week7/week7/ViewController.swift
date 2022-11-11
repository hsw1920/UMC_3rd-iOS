//
//  ViewController.swift
//  week7
//
//  Created by 김민경 on 2022/11/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginButtonDidTap(_ sender: Any) {
        guard let name = nameTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        
        // 값 꺼내오기
        UserDefaults.standard.string(forKey: name)
        
        // 이름, 비밀번호가 올바르게 매칭되는지 확인
        if UserDefaults.standard.string(forKey: name) == nil { // 회원가입이 되어있는지부터 확인
            print("데이터가 없습니다.")
        } else if password != UserDefaults.standard.string(forKey: name) {
            print("비밀번호가 알맞지 않습니다.")
        } else {
            print("로그인 성공!")
        }
        
        // 유저 정보 : 이름, 전화번호, 이메일 주소, 비밀번호
        // 단점 : 유저에 대한 정보를 한번에 꺼내고 싶으면 유저 디폴트를 따로 저장하고 if문을 통해 꺼내야하는 한계점이있다.
        // 장점 : 그냥 활용하기 편함 - 주로 자동 로그인을 구현할때 사용함
        // 자동 로그인? - 한번 로그인했으면 자동적으로 로그인되어있게!
        // 키 -> 로그인을 한 적이있나?
        // 값 -> 결과를 저장
        // 앱을 껏다켜도 로그인 과정을 스킵할 수 있게 사용!
    }
    
    
    @IBAction func signUpButtonDidTap(_ sender: Any) {
        guard let signupViewController = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier: "SignUPViewController") as? SignUPViewController else {return}
        
        navigationController?.pushViewController(signupViewController, animated: true)
                
    }
    
}

