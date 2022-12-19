//
//  ViewController.swift
//  week9-standard-2
//
//  Created by 홍승완 on 2022/11/24.
//

import UIKit
import KakaoSDKUser

class ViewController: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        loginBtn.setImage(UIImage(named: "KakaoLogin"), for: .normal)
    }

    @IBAction func kakaoLoginButtonDidTap(_ sender: UIButton) {
        
        // isKakaoTalkLoginAvailable() : 카톡 설치 되어있으면 true
        if (UserApi.isKakaoTalkLoginAvailable()) {
            
            //카톡 설치되어있으면 -> 카톡으로 로그인
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    print("카카오 톡으로 로그인 성공")
                    
                    _ = oauthToken
                    /// 로그인 관련 메소드 추가
                }
            }
        }
        else {

            // 카톡 없으면 -> 계정으로 로그인
            UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                if let error = error {
                    print(error)
                    print("로그인 실패")
                } else {
                    print("카카오 계정으로 로그인 성공")
                    
                    guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "NextViewController") as? NextViewController else {
                        return
                    }
                    
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                    
                    _ = oauthToken
                    // 관련 메소드 추가
                }
            }
        }
        
    }
    
}

