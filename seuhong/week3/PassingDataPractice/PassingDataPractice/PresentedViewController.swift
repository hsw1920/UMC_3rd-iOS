//
//  PresentedViewController.swift
//  PassingDataPractice
//
//  Created by νμΉμ on 2022/10/04.
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
