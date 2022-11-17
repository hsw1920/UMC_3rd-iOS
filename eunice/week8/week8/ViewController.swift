//
//  ViewController.swift
//  week8
//
//  Created by 김민경 on 2022/11/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redView: UIView!
    
    @IBOutlet weak var redViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var redViewHeightConstraint: NSLayoutConstraint!
    
    var flag=false
    
    @IBOutlet var redViewTapGesture: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redViewTapGesture.addTarget(self, action: #selector(redViewDidTap))
    }
    
    @objc func redViewDidTap() { // object-c 함수
        // TODO : 뭔가 작업
        if !flag {
            UIView.animate(
                    withDuration:3,
                    animations: {
                    self.redViewTopConstraint.constant = 50
                    self.redViewHeightConstraint.constant = 500
                    self.view.layoutIfNeeded()
                },
                completion: { _ in // 클로저 공부하기
                    self.flag=true

                }
            )
        } else {
                UIView.animate(
                    withDuration:3,
                    animations: {
                    self.redViewTopConstraint.constant = 199
                    self.redViewHeightConstraint.constant = 128
                    self.view.layoutIfNeeded()
                },
                completion: { _ in // 클로저 공부하기
                    self.flag = false
                }
            )
        }
    }

//    // 버튼을 누르면 뷰에 레이아웃을 바꾸도록 구현
//    @IBAction func btnDidTap(_ sender: Any) {
//        UIView.animate(
//            withDuration:3,
//            animations: {
//                // top, height 반대로 씀 - 수정하기
//                self.redViewTopConstraint.constant = 50
//                self.redViewHeightConstraint.constant = 500
//                self.view.layoutIfNeeded() // UI 변경사항에 대한 업데이트가 필요하다는것을 명령해주는것 (뷰한테)
//
//        })
//    }
//    // UIVIew.animate에는 여러가지 파라미터가 제공되는데, 필요한것만 사용하면 된다.
    
    
    
}

