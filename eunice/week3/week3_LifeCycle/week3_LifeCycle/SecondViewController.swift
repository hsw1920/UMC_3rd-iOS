//
//  SecondViewController.swift
//  week3_LifeCycle
//
//  Created by 김민경 on 2022/10/03.
//

import UIKit

class SecondViewController: UIViewController {

    // 덧셈의 결과를 담을 변수 선언
    var resultString="default 값" // 덧셈의 결과가 담길 예정
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = resultString // 덧셈의 결과
        // Do any additional setup after loading the view.
    }
    
    // 생명주기 전 단계이므로 viewWillAppear에서 처리해도 문제없음
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        resultLabel.text = resultString // 덧셈의 결과
//    }

}
