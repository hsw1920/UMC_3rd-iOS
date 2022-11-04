//
//  ViewController.swift
//  standard6
//
//  Created by 김민경 on 2022/11/03.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startStopBtn: UIButton!
    @IBOutlet weak var resetBtn: UIButton!
    
    var timerCounting:Bool = false // 부울값인 타이머 카운팅을 호출하는 변수 생성 (false로 초기화)
    var startTime:Date? // 시작 시간
    var stopTime:Date? // 중지 시간
    
    let userDefaults = UserDefaults.standard
    let START_TIME_KEY = "startTime" // 시작시간 키
    let STOP_TIME_KEY = "stopTime" // 중지시간 키
    let COUNTING_KEY = "countingKey" // 계산 키
    
    // 타이머 유형인 예약된 타이머 선언
    var scheduledTimer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 사용자 기본값에 저장된 모든것을 로드하고 꺼냄
        startTime = userDefaults.object(forKey: START_TIME_KEY) as? Date // 시작시간이 사용자와 동일 (키에 대한 defaults 객체를 선택한 다음 시작 시간 키를 선택적 날짜로 제공)
        stopTime = userDefaults.object(forKey: STOP_TIME_KEY) as? Date
        timerCounting = userDefaults.bool(forKey: COUNTING_KEY)
        
        // 닫았다가 다시 열면 시간 레이블을 올바른 시간으로 다시 설정
        if timerCounting {
            startTimer()
        }
        else {
            stopTimer()
            if let start = startTime {
                if let stop = stopTime {
                    let time = calcRestartTime(start: start, stop: stop)
                    let diff = Date().timeIntervalSince(time)
                    setTimeLabel(Int(diff))
                }
            }
        }
        
        // 원으로 모양 변경
        startStopBtn.layer.cornerRadius=40
        resetBtn.layer.cornerRadius=40
        // Do any additional setup after loading the view.
    }

    @IBAction func startStopAction(_ sender: Any) {
        // 시작 중지 작업 내에서 타이머가 계산 중인 경우 중지시간을 정확한 현재 시간으로 설정하여 날짜 호출
        if timerCounting {
            setStopTime(date: Date())
            stopTimer()
        }
        // 그렇지않으면 타이머를 시작
        else {
            // 중지 시간에 값이 있으면 사용자가 일정 시점에서 타이머를 중지했음을 의미
            if let stop = stopTime{
                // 다시 시작 시간은 다시 시작 시간을 계산할 함수와 같음
                let restartTime = calcRestartTime(start: startTime!, stop: stop)
                setStopTime(date: nil) // 사용자 기본 중지 시간을 nil로 설정
                // 시작 시간을 다시 시작 시작으로 설정
                setStartTime(date: restartTime)
            }
            else { // 그렇지않으면 (중지시간이 없는경우)
                // 사용자 기본 시작 시간을 시작 시간으로 설정
                // setStartTime(date: startTime)
                
                // 시작 중지 작업에서 중지, 시간이 0이면 실제로 다시 시작 시간을 원래 시작 시간이 아닌 새 날짜와 동일하게 설정하려는 경우 비어있게 된다.
                setStartTime(date: Date())
            }
            startTimer()
        }
    }
    
    // 다시 시작 시간을 계산할 함수와 같음
    func calcRestartTime(start: Date, stop: Date) -> Date {
        let diff = start.timeIntervalSince(stop)
        return Date().addingTimeInterval(diff)
    }
    
    // 초기화를 제공하지 않으므로 현재 시간만 중지 타이머를 호출하는 함수를 생성
    func stopTimer() {
        // nil이 아닌경우
        if scheduledTimer != nil {
            // 새 시간을 만드는 대신 예약된 타이머를 무효화
            scheduledTimer.invalidate()
        }
        // 타이머 계산
        setTimerCounting(false)
        // 정상 상태에 대해 중지하도록 설정
        startStopBtn.setTitle("시작", for:.normal)
        // 일반 상태에 대해 제목 색상을 UI 색상으로 설정
        startStopBtn.setTitleColor(UIColor.systemGreen, for:.normal)
    }

    // 시작 타이머를 호출하는 함수를 생성
    func startTimer() {
        // 0.1초마다 새로고침 값 함수 호출
        DispatchQueue.main.async { // 비동기 처리
            self.scheduledTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.refreshValue), userInfo: nil, repeats: true)
        }
        
        // 타이머 계산
        setTimerCounting(true)
        // 정상 상태에 대해 중지하도록 설정
        startStopBtn.setTitle("중지", for:.normal)
        // 일반 상태에 대해 제목 색상을 UI 색상으로 설정
        // startStopBtn.setTitleColor(UIColor.red, for:.normal)
    }
    
    // 새로고침값을 호출하는 함수
    @objc func refreshValue() {
        // 이 시작 시간과 같으면 실제로 시작 시간에 값이 있는 경우
        if let start = startTime {
            // 현재 날짜 시간이 시작 시간 이후 밀리초 시간 간격인 경우 차이 계산
            let diff = Date().timeIntervalSince(start)
            setTimeLabel(Int(diff))
        }
        else { // 시작 시간이 없으면 타이머를 중지하고
            stopTimer()
            // 시간 레이블을 다시 0으로 설정
            setTimeLabel(0)
        }
    }
    
    // 함수 설정 시간 레이블
    func setTimeLabel(_ val: Int) {
        let time = secondsToHoursMinutesSeconds(val)
        let timeString = makeTimeString(hour: time.0, min: time.1, sec: time.2)
        timeLabel.text = timeString
    }
    
    // 밀리초를 이용하여 시간, 분, 초를 호출하는 함수 생성
    func secondsToHoursMinutesSeconds(_ ms:Int) -> (Int, Int, Int) {
        let hour = ms / 3600
        let min = (ms%3600) / 60
        let sec = (ms%3600) % 60
        return (hour, min, sec)
    }
    
    // 시간, 분, 초를 사용하여 문자열로 변환
    func makeTimeString (hour: Int, min: Int, sec: Int) -> String {
        var timeString = ""
        timeString += String(format:"%02d", hour)
        timeString += ":"
        timeString += String(format:"%02d", min)
        timeString += ":"
        timeString += String(format:"%02d", sec)
        return timeString
    }
    
    // 시간 재설정 작업을 수행하므로 시간이 재설정되면
    @IBAction func resetAction(_ sender: Any) {
        // 중지시간을 nil로 설정하고
        setStopTime(date: nil)
        // 시간시간을 nil로 설정하기
        setStartTime(date: nil)
        
        // 0으로 초기화
        timeLabel.text = makeTimeString(hour: 0, min: 0, sec: 0)
        
        // 중지 타이머
        stopTimer()
    }
    
    // 시작 시간을 설정하는 호출함수 생성할 것이므로 사용자 기본값을 업데이트하여 날짜를 수신
    func setStartTime(date: Date?) {
        // 시작 시간을 전달된 날짜와 동일하게 설정
        startTime = date
        // 기본값을 설정하여 사용자 기본값이 시작 시간 키의 날짜를 설정
        userDefaults.set(startTime, forKey: START_TIME_KEY)
    }
    
    // 설정된 중지 시간을 호출하는 함수 생성 (중지 시간에 대해 위와 같은 동일한 작업을 수행)
    func setStopTime(date: Date?) {
        stopTime = date
        userDefaults.set(stopTime, forKey: STOP_TIME_KEY)
    }
    
    // 계산할때는 위와 동일한 작업을 수행하고 날짜 대신 부울을 수신함.
    func setTimerCounting(_ val: Bool) {
        timerCounting = val
        userDefaults.set(timerCounting, forKey: COUNTING_KEY)
    }
    
}

