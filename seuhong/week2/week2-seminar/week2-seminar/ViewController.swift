//
//  ViewController.swift
//  week2-seminar
//
//  Created by 홍승완 on 2022/09/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var todayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func profileButtonDidtap(_ sender: UIButton) {
        todayLabel.text = "버튼 클릭"
    }
    
}

