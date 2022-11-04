//
//  ViewController.swift
//  semina_w6
//
//  Created by 강석호 on 2022/10/31.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
    var colorList: [UIColor] = [
        .blue,
        .gray,
        .green,
        .red,
        .yellow
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        threadTest()
        // Do any additional setup after loading the view.
    }
    
    func threadTest(){
        //단일 스레드 작업 -> sync
        //멀티 스레드 작업 -> async
        DispatchQueue.global().async {
                for color in self.colorList {
                    DispatchQueue.main.sync {
                        self.firstView.backgroundColor = color
                    }
                    sleep(1)
                }
            }
        }
    }



