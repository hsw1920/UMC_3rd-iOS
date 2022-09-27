//
//  MainViewController.swift
//  week2-challenge
//
//  Created by 홍승완 on 2022/09/27.
//

import UIKit

class MainViewController: UIViewController {


    @IBOutlet weak var registerBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        registerBtn.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30)
        registerBtn.configuration?.background.strokeColor = .white
        registerBtn.configuration?.background.strokeWidth = 1
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
