//
//  ViewController.swift
//  week4
//
//  Created by 김민경 on 2022/10/28.
//

import UIKit

// delegate : 정해져있는 메소드를 대신 실행시켜줌

protocol labelChangeProtocol {
    func onChange(text: String) // text는 String 타입으로 전달
}

// 뷰컨트롤러가 protocol을 채택함으로써 (매뉴얼을 따르겠다!) 부모뷰로 값이 넘어왔을때 text가 변경되게 구현
class ViewController: UIViewController, labelChangeProtocol {
    
    // 부모뷰에서 정의했지만, 자식뷰에서 사용 (대신 처리)
    func onChange(text: String) { // 프로토콜 채택시, 반드시 구현해야 하는 최소 요구 사항, 부모뷰에는 정의만해두고 사용하지는 않음. (자식뷰에서 사용해야한다.)
        label.text=text // 최소 요구사항 구현
    }
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonDidTap(_ sender: Any) {
        guard let SecondViewController = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {return}
        
        SecondViewController.modalPresentationStyle = .fullScreen
        SecondViewController.delegate=self // 자식뷰에 delegate 변수는 부모뷰(자기자신)다 - 반드시 선언해줘야함
        present(SecondViewController, animated: true)
    }
}

