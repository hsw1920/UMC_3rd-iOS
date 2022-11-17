//
//  SecondViewController.swift
//  standard4
//
//  Created by 김민경 on 2022/10/30.
//

import UIKit
import Lottie

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let animationView = AnimationView(name: "checkbox") // AnimationView(name: "lottie json 파일 이름")으로 애니메이션 뷰 생성
        animationView.frame = CGRect(x: 30, y: 120, width: 30, height: 30) // 애니메이션뷰의 크기 설정
        //animationView.center = self.view.center // 애니메이션뷰의 위치설정
        animationView.contentMode = .scaleAspectFill // 애니메이션뷰의 콘텐트모드 설정

        let animationView2 = AnimationView(name: "checkbox") // AnimationView(name: "lottie json 파일 이름")으로 애니메이션 뷰 생성
        animationView2.frame = CGRect(x: 30, y: 150, width: 30, height: 30) // 애니메이션뷰의 크기 설정
        animationView2.contentMode = .scaleAspectFill // 애니메이션뷰의 콘텐트모드 설정

        let animationView3 = AnimationView(name: "checkbox") // AnimationView(name: "lottie json 파일 이름")으로 애니메이션 뷰 생성
        animationView3.frame = CGRect(x: 30, y: 180, width: 30, height: 30) // 애니메이션뷰의 크기 설정
        animationView3.contentMode = .scaleAspectFill // 애니메이션뷰의 콘텐트모드 설정

        let animationView4 = AnimationView(name: "checkbox") // AnimationView(name: "lottie json 파일 이름")으로 애니메이션 뷰 생성
        animationView4.frame = CGRect(x: 30, y: 210, width: 30, height: 30) // 애니메이션뷰의 크기 설정
        animationView4.contentMode = .scaleAspectFill // 애니메이션뷰의 콘텐트모드 설정

        view.addSubview(animationView) // 애니메이션뷰를 메인뷰에 추가
        view.addSubview(animationView2) // 애니메이션뷰를 메인뷰에 추가
        view.addSubview(animationView3) // 애니메이션뷰를 메인뷰에 추가
        view.addSubview(animationView4) // 애니메이션뷰를 메인뷰에 추가

        animationView.play() // 애미메이션뷰 실행
        animationView2.play() // 애미메이션뷰 실행
        animationView3.play() // 애미메이션뷰 실행
        animationView4.play() // 애미메이션뷰 실행
        // Do any additional setup after loading the view.
    }
    

   

}
