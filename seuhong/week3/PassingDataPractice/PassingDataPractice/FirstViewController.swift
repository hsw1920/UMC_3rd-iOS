//
//  FirstViewController.swift
//  PassingDataPractice
//
//  Created by 홍승완 on 2022/10/04.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var delegateLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func presentBtnTapped(_ sender: UIButton) {
        
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PresentedViewController") as? PresentedViewController else { return }
        
        vc.message = textField.text!
        
        present(vc, animated: true)
    }
    
    
    @IBAction func delegateBtnTapped(_ sender: UIButton) {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DelegateViewController") as? DelegateViewController else {
            return
        }
        vc.delegate = self
        present(vc,animated: true)
    }
    
}

// protocol 확장
extension FirstViewController: SampleDelegate {
    func setLabel(text: String) {
        if text == "" {
            delegateLabel.text = "다시 입력해주세요"
        } else {
            delegateLabel.text = "넘겨받은 값: \(text)"
        }
        
    }
}

