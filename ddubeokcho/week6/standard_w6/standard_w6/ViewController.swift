//
//  ViewController.swift
//  standard_w6
//
//  Created by 강석호 on 2022/11/04.
//

import UIKit

class ViewController: UIViewController {

    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0 // 인터벌을 1초로 시간화 ㅇㅇ
    var selectTime = "" //
    
    @IBOutlet weak var IbCurrentTime: UILabel!
    @IBOutlet weak var IbPickerTime: UILabel!
     
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm"
        UserDefaults.standard.setValue("선택시간 : \(formatter.string(from: datePickerView.date))", forKey: "key")

        selectTime = formatter.string(from: datePickerView.date)
    }
    
    
    
    @IBAction func btn(_ sender: UIButton) {
        IbPickerTime.text = UserDefaults.standard.string(forKey: "key")
    }
    //Async Task 1초당 1번씩 구동
    @objc func updateTime() {
        let date = NSDate()
        let formatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm"
        
        IbCurrentTime.text = "현재시간 : \(formatter.string(from: date as Date))"
        
        let currentTime = formatter.string(from: date as Date)
        if selectTime == currentTime {
            let alert = UIAlertController(title: "알림", message: "설정한 시간입니다.", preferredStyle: UIAlertController.Style.alert)
            let alertAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: {ACTION in self.selectTime = ""})
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
        }
    }
}

