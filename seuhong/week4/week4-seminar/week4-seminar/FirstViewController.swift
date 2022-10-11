//
//  FirstViewController.swift
//  week4-seminar
//
//  Created by 홍승완 on 2022/10/11.
//

import UIKit

protocol labelChangeProtocol {
    func onChange(text: String)
}

// protocol 채택 -> 이 메뉴얼을 따르겠다 + 최소요구사항의 구현부를 반드시 구현해야함

class FirstViewController: UIViewController, labelChangeProtocol {
    
    func onChange(text: String) {
        label.text = text
    }
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func btnDidTap(_ sender: UIButton) {
        guard let SecondViewController = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        SecondViewController.modalPresentationStyle = .fullScreen
        
        // delegate 위임은 필수
        SecondViewController.delegate = self
        
        present(SecondViewController, animated: true)
    }
    

}
