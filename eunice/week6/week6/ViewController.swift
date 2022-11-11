//
//  ViewController.swift
//  week6
//
//  Created by 김민경 on 2022/10/31.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        thredTest()
        // Do any additional setup after loading the view.
    }
    
    var colorlist: [UIColor] = [
        .red,
        .orange,
        .yellow,
        .green,
        .brown,
        .darkText,
        .lightText,
        .blue,
    ]
    
    func thredTest() {
        // 비동기
        DispatchQueue.global().async {
            for color in self.colorlist {
                DispatchQueue.main.sync{
                    self.firstView.backgroundColor=color
                }
                sleep(1)
            }
        }
        DispatchQueue.global().async {
            for color in self.colorlist.reversed() { // 역으로
                DispatchQueue.main.sync{
                    self.secondView.backgroundColor=color
                }
                sleep(1)
            }
        }
    }
    // 메인 스레드에서는 어떤걸 하나 -> UI업데이트 작업, UI관련 작업 이유는? 애플에서 지정을 해놨음
    // 백그라운드 스레드에서는 어떤걸 하나 -> UI외에 모든것 작업
}

