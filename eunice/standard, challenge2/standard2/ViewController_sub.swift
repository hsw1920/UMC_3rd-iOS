//
//  ViewController_sub.swift
//  standard2
//
//  Created by 김민경 on 2022/09/29.
//

import UIKit

class ViewController_sub: UIViewController {

    @IBOutlet weak var bSoundOff: UIButton!
    
    @IBOutlet weak var bKeypad: UIButton!
    @IBOutlet weak var bAudio: UIButton!
    @IBOutlet weak var bPhone: UIButton!
    @IBOutlet weak var bFaceTime: UIButton!
    @IBOutlet weak var bContact: UIButton!
    @IBOutlet weak var bOn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bSoundOff.layer.cornerRadius=40
        bKeypad.layer.cornerRadius=40
        bAudio.layer.cornerRadius=40
        bPhone.layer.cornerRadius=40
        bFaceTime.layer.cornerRadius=40
        bContact.layer.cornerRadius=40
        bOn.layer.cornerRadius=40
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func bOn(_ sender: Any) {
        guard let viewController_sub = self.storyboard?.instantiateViewController(withIdentifier: "phoneKeypad") else {return}
        self.present(viewController_sub, animated: true, completion:nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
