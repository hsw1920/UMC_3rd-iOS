//
//  ViewController.swift
//  week6-seminar
//
//  Created by 홍승완 on 2022/10/31.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
    let colorList: [UIColor] = [
        .red,
        .blue,
        .black,
        .yellow,
        .systemPink,
        .brown,
        .lightGray,
        .cyan,
        .darkGray,
        .purple,
        .orange
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        threadTest()
    }
    
    func threadTest(){
        DispatchQueue.global().async {
            for color in self.colorList {
                DispatchQueue.main.sync {
                    self.firstView.backgroundColor = color
                }
                sleep(1)
            }
        }
        
        DispatchQueue.global().async {
            for color in self.colorList.reversed() {
                DispatchQueue.main.sync {
                    self.secondView.backgroundColor = color
                }
                sleep(1)
            }
        }
    }
    


}

