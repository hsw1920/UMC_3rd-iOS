//
//  SecondViewController.swift
//  week4-seminar
//
//  Created by 홍승완 on 2022/10/11.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var delegate: labelChangeProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func backBtnDidTap(_ sender: UIButton) {
        guard let text = textField.text else { return }
        delegate?.onChange(text: text)
        dismiss(animated: true)
    }
    
}
