//
//  MainViewController.swift
//  week2-challenge
//
//  Created by 홍승완 on 2022/09/27.
//

import UIKit
import SideMenu

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
        //navigationController?.pushViewController(vc, animated: true)
        
        let sideMenu = SideMenuNavigationController(rootViewController: vc)
        setUpSideMenuNavigationVC(vc: self, next_vc: sideMenu)
        present(sideMenu, animated: true, completion: nil)
    }
    
    func customSetting() {
        registerBtn.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30)
        registerBtn.configuration?.background.strokeColor = .white
        registerBtn.configuration?.background.strokeWidth = 1
    }
    
    func setUpSideMenuNavigationVC(vc: MainViewController, next_vc: SideMenuNavigationController) {

        next_vc.sideMenuDelegate = vc
        next_vc.presentationStyle = .menuSlideIn
        next_vc.leftSide = true
        next_vc.menuWidth = (view.bounds.width / 5) * 3
        next_vc.presentationStyle.backgroundColor = .black
        next_vc.presentationStyle.presentingEndAlpha = 0.5
        next_vc.presentDuration = 0.7
    }
    
}

extension MainViewController: SideMenuNavigationControllerDelegate {

}


