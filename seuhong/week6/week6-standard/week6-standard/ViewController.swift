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
    @IBOutlet weak var timerView: UIView!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var stopButton: UIButton!
    
    var hour:Int = 0
    var minutes:Int = 0
    var seconds:Int = 0
    
    var timer: Timer?
    var number: Int = 0
    var timerIsOn: Bool = false
    var timerSet: Bool = false
    var setNum: Int = 0
    
    var curIndex: Int = TimerData.list.count
    var delegate: TimerProtocol?
    
    // Core Animation
    let shape = CAShapeLayer()
    let backCircle = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
        print("TimerView1 setted")
    }
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
    }
    
    @IBAction func onTimerStop(_ sender: UIButton) {
        // timer 정지
        timerIsOn = false
        timerSet = false
        timerView.isHidden = true
        picker.isHidden = false
        shape.isHidden = true
        backCircle.isHidden = true
        pauseAnimation()
        //timer?.invalidate()
        TimerData.list[curIndex].timer.invalidate()
        TimerData.list.remove(at: curIndex)
        toggleButton.setImage(UIImage(systemName: "play.circle"), for: .normal)
        timerLabel.text = timeFormatter(time: 0)
        remainingLabel.text = timeFormatter(time: 0)
        elapsedLabel.text = timeFormatter(time: 0)
    }
    @IBAction func onTimerStart(_ sender: Any) {
        // 꺼져있을 때
        if !timerIsOn {
            if !timerSet {
                timerSet = true
                number = hour*3600 + minutes*60 + seconds
                setNum = number
                timerLabel.text = timeFormatter(time: number)
                remainingLabel.text = timeFormatter(time: number)
                elapsedLabel.text = timeFormatter(time: setNum - number)
                timerView.isHidden = false
                timerLabel.isHidden = false
                picker.isHidden = true
                
                print("현재 넘버 : \(number)")
                makeCircle(number)
            }
            
            // pause
            timerIsOn.toggle()
            toggleButton.setImage(UIImage(systemName: "pause.circle"), for: .normal)
            
            // TimerData 리스트에 추가
            // 시간이 줄어야함 -> 비동기처리
            TimerData.list.append(TimerData(
                time: self.number,
                timer: Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
                    DispatchQueue.main.async {
                        self.timerCallback()
                        self.delegate?.refreshTable()
                    }
                })
            ))
            
            resumeAnimation()
            
        } else { // 켜져있을 때
            // 현재 데이터의 timer 중지
            TimerData.list[curIndex].timer.invalidate()
            timerIsOn.toggle()
            toggleButton.setImage(UIImage(systemName: "play.circle"), for: .normal)
            pauseAnimation()
        }
        
    }

    func timerCallback() {
        number -= 1
        TimerData.list[curIndex].time = number
        
        // 0초가 되면
        if number == 0 {
            // TimerData 리스트에서 끝내고 중지
            TimerData.list[curIndex].timer.invalidate()
            TimerData.list.remove(at: curIndex)
            
            timerIsOn.toggle()
            toggleButton.setImage(UIImage(systemName: "play.circle"), for: .normal)
            
            // timerLabel 숨기고 pickerView 보이게
            timerLabel.isHidden = true
            picker.isHidden = false
            shape.isHidden = true
            backCircle.isHidden = true
            timerSet = false
            timerIsOn = false
            timerView.isHidden = true
            
            timerLabel.text = timeFormatter(time: 0)
            remainingLabel.text = timeFormatter(time: 0)
            elapsedLabel.text = timeFormatter(time: 0)
        }
        else {
            timerLabel.text = timeFormatter(time: number)
            remainingLabel.text = timeFormatter(time: number)
            elapsedLabel.text = timeFormatter(time: setNum - number)
        }
    }
    
    func timeFormatter(time : Int) -> String{
        let hours = Int(time) / 60 / 60
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    func makeCircle(_ number: Int){
        shape.isHidden = false
        backCircle.isHidden = false
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: view.bounds.width/2, y: view.bounds.width/2 + safeAreaTopInset()), radius: 150, startAngle: -.pi/2, endAngle: .pi*3/2, clockwise: true)
        
        // 어두운 circle
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
        animation.duration = CFTimeInterval(number)
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        shape.add(animation, forKey: "animation")
        shape.speed = 0
    }
    
    // device의 safeArea의 TopInset을 반환하는 코드
    func safeAreaTopInset() -> CGFloat {
        let statusHeight = UIApplication.shared.statusBarFrame.size.height   // 상태바 높이
        
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            let topPadding = (window?.safeAreaInsets.top)! +
            CGFloat(self.navigationController?.navigationBar.frame.height ?? 0.0)
            return topPadding
        } else {
            return statusHeight
        }
    }
    
    func pauseAnimation() {
        let pausedTime = shape.convertTime(CACurrentMediaTime(), from: nil)
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

extension ViewController:UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 24
        case 1,2:
            return 60

        default:
            return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return pickerView.frame.size.width/3
    }
  
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return "\(row) 시간"
        case 1:
            return "\(row) 분"
        case 2:
            return "\(row) 초"
        default:
            return ""
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            hour = row
        case 1:
            minutes = row
        case 2:
            seconds = row
        default:
            break;
        }
    }
}
