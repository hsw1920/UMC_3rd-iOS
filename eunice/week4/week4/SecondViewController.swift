//
//  SecondViewController.swift
//  week4
//
//  Created by 김민경 on 2022/10/28.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    // var delegate: labelChangeProtocol? == 부모뷰가 되는것!
    var delegate: labelChangeProtocol? // type만 옵셔널로 선언 (정의는 하지않았음.)
    // 데이터타입은 언제나 정의되어있어야함! (var number:Int = 10 이런식으로!) - 반드시 초기화 시켜야함 (부모뷰에서 초기화 시킴, 값이 넘어가기전에 SecondViewController.delegate=self 이런식으로!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        guard let text=textField.text else {return}
        
        delegate?.onChange(text: text) // protocol에 접근해서 함수 실행 (부모뷰의 함수가 실행된다고 생각하면됨! - 간단하게)
        dismiss(animated: true) // 화면 끄기
    }

}
