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
//        print("버튼이 터치됐습니다!")
//        todayLabel.text = "버튼 클릭"// text값 변경
        
         // typecasting (opitonal 이용)
        guard let presentedViewController = UIStoryboard(name : "Main", bundle:nil).instantiateViewController(withIdentifier: "presentedViewController") as? presentedViewController else {return}

        present(presentedViewController, animated: true)
        
//        guard let pushedViewController = UIStoryboard(name : "Main", bundle:nil).instantiateViewController(withIdentifier: "pushedViewController") as? pushedViewController else {return}
//
//      navigationController?.pushViewController(pushedViewController, animated: true)
    }
    

}

