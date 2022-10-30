//
//  ViewController.swift
//  standard_w5
//
//  Created by 강석호 on 2022/10/30.
//

import UIKit
import Lottie

class MainViewController: UIViewController {

    let titleLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.text = "메인화면"
        label.font = UIFont.boldSystemFont(ofSize: 70)
        return label
    }()
    
    let animationView: LottieAnimationView = {
        
        let animView = LottieAnimationView(name: "125139-happy-halloween")
        animView.frame = CGRect(x:0,y:0,width: 400,height: 400)
        animView.contentMode = .scaleAspectFill
        return animView
    }()
    
    //뷰가 생성되었을때
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .black
        view.addSubview(animationView)
        animationView.center = view.center
        
        
        //애니매이션 실행
        animationView.play{ (finish) in
            
            print("할로윈...")
            
            self.view.backgroundColor = .white
            self.animationView.removeFromSuperview()
            
            self.view.addSubview(self.titleLabel)
            
            self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
            self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.titleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
            
        }
    }


}

