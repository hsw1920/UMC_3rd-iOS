//
//  ViewController.swift
//  week6-standard
//
//  Created by 홍승완 on 2022/11/01.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var toggleButton: UIButton!
    @IBOutlet weak var elapsedLabel: UILabel!
    @IBOutlet weak var remainingLabel: UILabel!
    
    var timer: Timer?
    var number: Int = 60
    var timerIsOn: Bool = false;
    
    // Core Animation
    let shape = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeCircle()

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
            resumeAnimation()
            //print("change pause")
        } else { // 켜져있을 때
            timer?.invalidate()
            timerIsOn.toggle()
            toggleButton.setImage(UIImage(systemName: "play.circle"), for: .normal)
            //print("change play")
            pauseAnimation()
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
        remainingLabel.text = timeFormatter(time: number)
        elapsedLabel.text = timeFormatter(time: 60-number)
    }
    
    func timeFormatter(time : Int) -> String{
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
    
    func makeCircle(){
        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: view.bounds.width/2, y: view.bounds.width/2 + safeAreaTopInset()), radius: 150, startAngle: -.pi/2, endAngle: .pi*3/2, clockwise: true)
        
        // 어두운 circle
        let backCircle = CAShapeLayer()
        backCircle.path = circlePath.cgPath
        backCircle.lineWidth = 5
        backCircle.strokeColor = UIColor(red: 99/255, green: 73/255, blue: 172/255, alpha: 1).cgColor
        backCircle.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(backCircle)
        
        // 애니메이션 되는 circle
        shape.path = circlePath.cgPath
        shape.lineWidth = 5
        shape.strokeColor = UIColor(red: 157/255, green: 125/255, blue: 217/255, alpha: 1).cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeEnd = 0
        view.layer.addSublayer(shape)
        
        // 애니메이션
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 60
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        shape.add(animation, forKey: "animation")
        shape.speed = 0
    }
    
    
    func safeAreaTopInset() -> CGFloat {
        let statusHeight = UIApplication.shared.statusBarFrame.size.height   // 상태바 높이
        
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            let topPadding = window?.safeAreaInsets.top
            return topPadding ?? statusHeight
        } else {
            return statusHeight
        }
    }
    
    
    func pauseAnimation() {
        let pausedTime = shape.convertTime(CACurrentMediaTime(), from: nil)
        print(pausedTime)
        shape.speed = 0
        shape.beginTime = pausedTime
        shape.timeOffset = pausedTime
    }

    func resumeAnimation() {
        let pausedTime = shape.timeOffset
        print(pausedTime)
        shape.speed = 1
        shape.timeOffset = 0
        shape.beginTime = 0
        let timeSincePause = shape.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        shape.beginTime = timeSincePause
    }
    
    
}

