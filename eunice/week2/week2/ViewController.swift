//
//  ViewController.swift
//  week2
//
//  Created by 김민경 on 2022/09/26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var profileButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func profileButtonDidtap(_ sender: Any) {
        print("버튼이 터치됐습니다!")
        todayLabel.text = "버튼 클릭"// text값 변경
    }
    

}

