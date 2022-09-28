//
//  ViewController.swift
//  TimerMotion
//
//  Created by 홍승완 on 2022/09/28.
//

import UIKit
import HGCircularSlider

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var toggleButton: UIButton!
    
    var timer: Timer?
    var number: Int = 60
    var timerIsOn: Bool = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
    }
    @IBAction func onTimerStart(_ sender: Any) {
        // 꺼져있을 때
        if !timerIsOn {
            // pause로 바꾸고
            timerIsOn.toggle()
            toggleButton.setImage(UIImage(systemName: "pause.circle"), for: .normal)
            // 시간이 줄어야함
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(timerCallback),
                userInfo: nil,
                repeats: true)
            
            print("change pause")
        } else { // 켜져있을 때
            timer?.invalidate()
            timerIsOn.toggle()
            toggleButton.setImage(UIImage(systemName: "play.circle"), for: .normal)
            print("change play")
        }

    }
    
    @objc
    func timerCallback() {
        number -= 1
        
        // 0초가 되면
        if number == 0 {
            timer?.invalidate()
            timerIsOn.toggle()
            toggleButton.setImage(UIImage(systemName: "play.circle"), for: .normal)
            number = 60
        }
        
        timerLabel.text = timeFormatter(time: number)
    }
    
    func timeFormatter(time : Int) -> String{
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }

}

