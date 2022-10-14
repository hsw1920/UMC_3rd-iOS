//
//  DelegateViewController.swift
//  PassingDataPractice
//
//  Created by 홍승완 on 2022/10/04.
//

import UIKit

protocol SampleDelegate {
    func setLabel(text: String)
}

class DelegateViewController: UIViewController {

   
    @IBOutlet weak var textLabel: UITextField!
    var delegate: SampleDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func backBtnTapped(_ sender: UIButton) {
        if let text = textLabel.text {
            delegate?.setLabel(text: text)
        }
        dismiss(animated: true)
    }
    
}
