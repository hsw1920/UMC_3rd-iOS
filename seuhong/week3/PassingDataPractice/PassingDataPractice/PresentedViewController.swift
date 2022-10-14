//
//  PresentedViewController.swift
//  PassingDataPractice
//
//  Created by 홍승완 on 2022/10/04.
//

import UIKit

class PresentedViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var message = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = message
        
        
    }
}
