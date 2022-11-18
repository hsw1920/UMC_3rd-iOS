//
//  ViewController.swift
//  week8-seminar
//
//  Created by 홍승완 on 2022/11/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var orangeViewTopConstaint: NSLayoutConstraint!
    @IBOutlet weak var orangeViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet var orangeViewTapGestureRecognizer: UITapGestureRecognizer!
    
    var isTrue: Bool = false
    var hc = NSLayoutConstraint().constant
    var tc = NSLayoutConstraint().constant
    
    var phc = NSLayoutConstraint().constant
    var ptc = NSLayoutConstraint().constant
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        hc = 500
        tc = 50
        ptc = orangeViewTopConstaint.constant
        phc = orangeViewHeightConstraint.constant
        orangeViewTapGestureRecognizer.addTarget(self, action: #selector(orangeViewDidTap))
    }

    @objc func orangeViewDidTap() {
        
        if(isTrue){
            UIView.animate(
                withDuration: 1,
                animations: {
                    self.orangeViewTopConstaint.constant = self.tc
                    self.orangeViewHeightConstraint.constant = self.hc
                    self.view.layoutIfNeeded()
                },
                completion: { _ in
                    self.isTrue.toggle()
                }
            )
        }
        
        else {
            UIView.animate(
                withDuration: 1,
                animations: {
                    self.orangeViewTopConstaint.constant = self.ptc
                    self.orangeViewHeightConstraint.constant = self.phc
                    self.view.layoutIfNeeded()
                },
                completion: { _ in
                    self.isTrue.toggle()
                }
            )
        }
        
        
    }

    @IBAction func buttonDidTap(_ sender: UIButton) {
        isTrue.toggle()
        if(isTrue){
            UIView.animate(
                withDuration: 1) {
                    self.orangeViewTopConstaint.constant = self.tc
                    self.orangeViewHeightConstraint.constant = self.hc
                    self.view.layoutIfNeeded()
                }
            
        }
        else {
            UIView.animate(
                withDuration: 1) {
                    self.orangeViewTopConstaint.constant = self.ptc
                    self.orangeViewHeightConstraint.constant = self.phc
                    self.view.layoutIfNeeded()
                }
            
        }
        
        
    }
}

