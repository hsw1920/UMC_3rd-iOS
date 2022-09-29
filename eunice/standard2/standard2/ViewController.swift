//
//  ViewController.swift
//  standard2
//
//  Created by 김민경 on 2022/09/29.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    @IBOutlet weak var b10: UIButton!
    @IBOutlet weak var b0: UIButton!
    @IBOutlet weak var b11: UIButton!
    @IBOutlet weak var bCall: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        b1.layer.cornerRadius=40
        b2.layer.cornerRadius=40
        b3.layer.cornerRadius=40
        b4.layer.cornerRadius=40
        b5.layer.cornerRadius=40
        b6.layer.cornerRadius=40
        b7.layer.cornerRadius=40
        b8.layer.cornerRadius=40
        b9.layer.cornerRadius=40
        b10.layer.cornerRadius=40
        b0.layer.cornerRadius=40
        b11.layer.cornerRadius=40
        bCall.layer.cornerRadius=40
        
        // Do any additional setup after loading the view.
    }

    @IBAction func bCall(_ sender: Any) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "phoneCall") else {return}
        self.present(viewController, animated: true, completion:nil)
    }
    
}

