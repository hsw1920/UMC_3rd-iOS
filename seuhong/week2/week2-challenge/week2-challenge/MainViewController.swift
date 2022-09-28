//
//  MainViewController.swift
//  week2-challenge
//
//  Created by 홍승완 on 2022/09/27.
//

import UIKit

class MainViewController: UIViewController {

    
    
    @IBOutlet weak var sideMenuButton: UIBarButtonItem!

    
    @IBOutlet weak var registerBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        customSetting()
        
            }
    
    
    @IBAction func sideMenuBtnTapped(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SideMenuViewController")
        
        //present(vc, animated: true)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func customSetting() {
        registerBtn.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30)
        registerBtn.configuration?.background.strokeColor = .white
        registerBtn.configuration?.background.strokeWidth = 1
    }
    
}

