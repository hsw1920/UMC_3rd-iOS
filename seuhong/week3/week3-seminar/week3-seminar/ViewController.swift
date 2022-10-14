//
//  ViewController.swift
//  week3-seminar
//
//  Created by 홍승완 on 2022/10/03.
//

import UIKit

protocol delegate {
    var label1: String {get set}
    var label2: String {get set}
}


class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisppear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }

    @IBAction func presentBtnTapped(_ sender: UIButton) {
        
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PresentedViewController") as? PresentedViewController else { return }
        
        
        // 덧셈을 해서 다음 뷰에 넘기는 로직
        guard let firstNumber = firstTextField.text else { return }
        guard let secondNumber = secondTextField.text else { return }
        // 덧셈 결과 담기
        let res = Int(firstNumber)! + Int(secondNumber)!
        vc.resultString = String(res)
        
        
        
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
        
        
    }
    
    @IBAction func PushBtnTapped(_ sender: UIButton) {
        
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PushViewController") as? PushViewController else { return }
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

