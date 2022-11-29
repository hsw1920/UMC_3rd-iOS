//
//  SecondViewController.swift
//  standard4
//
//  Created by 김민경 on 2022/11/17.
//

import UIKit

class SecondViewController: UIViewController, UIGestureRecognizerDelegate {
    
    
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
        tapGesture.delegate = self
        
        self.navigationController?.navigationBar.tintColor = .systemYellow // back 버튼 색변경
        self.view.addGestureRecognizer(tapGesture) // 제스쳐
        // Do any additional setup after loading the view.
    }
    
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        let bar = self.navigationController?.navigationBar
        
        
        UIView.animate(withDuration: 0.3) { // 네비게이션 바 사라지기
            bar?.alpha = bar?.alpha == 0 ? 1 : 0
            self.view.endEditing(true)
        }
        
        return true
    }
    
}
