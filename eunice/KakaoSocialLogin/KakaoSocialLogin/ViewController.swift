//
//  ViewController.swift
//  KakaoSocialLogin
//
//  Created by 김민경 on 2022/11/30.
//

import UIKit
import KakaoSDKUser

class ViewController: UIViewController {
    
    @IBOutlet weak var kakaoLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kakaoLoginButton.setImage(UIImage(named: "KakaoImage"), for: .normal)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func kakaoLoginButtonTouchUpInside(_ sender: UIButton) {
        
        // isKakaoTalkLoginAvailable() : 카톡 설치 되어있으면 true
        if (UserApi.isKakaoTalkLoginAvailable()) {
            //카톡 설치되어있으면 -> 카톡으로 로그인
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    print("loginWithKakaoTalk() success.")
                    
                    //do something
                    _ = oauthToken
                }
            }
        }
        else {
            // 카톡 없으면 -> 계정으로 로그인
            UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                if let error = error {
                    print(error)
                    print("oginWithKakaoAccount() fail.")
                } else {
                    print("oginWithKakaoAccount() success.")
                    
                    //do something
                    _ = oauthToken
                }
            }
        }
    }
}

