//
//  HomeViewController.swift
//  week6-standard
//
//  Created by 홍승완 on 2022/11/03.
//

import UIKit

protocol TimerProtocol {
    func refreshTable()
}

class TimerData {
    var time: Int = 0
    var timer: Timer
    init(time: Int, timer: Timer) {
        self.time = time
        self.timer = timer
    }
    static var list: [TimerData] = [
    ]
}

var indexCur = 0

class HomeViewController: UIViewController, TimerProtocol {
    @IBOutlet weak var lastTimer: UILabel!
    
    var timerIsOn: Bool = false
    
    func refreshTable(){
        self.tableView.reloadData()
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        indexCur = 0
    }

    
    @IBAction func btnTapped(_ sender: UIButton) {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as? ViewController else { return }
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func lastTimerTapped(_ sender: UIButton) {
        lastTimer.text = "최근 종료 시간 : \(UserDefaults.standard.string(forKey: "lastTimer") as! String)"        
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var num = 0
        TimerData.list.map { data in
            if data.time != 0 {
                num += 1
            }
        }
        indexCur = 0
        print("------------/// :  \(num)")
        return num
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TimerCell") as? TimerCell else {
            return UITableViewCell()
        }
        
        if indexCur == 0 {
            if TimerData.list[indexPath.row].time == 0 {
                var idx = indexCur
                while(TimerData.list[idx].time == 0){
                    idx+=1;
                }
                cell.configure(idx)
                indexCur = idx
                print(">>>0 \(TimerData.list[indexCur].time)")
            } else {
                print(">>>1 \(TimerData.list[indexCur].time)")
                cell.configure(indexPath.row)
            }
        } else {
            
            print("indexCur: \(indexCur)")
            print(TimerData.list[indexCur].time)
            if TimerData.list[indexCur].time == 0 {
                while(TimerData.list[indexCur].time == 0){
                    indexCur+=1;
                }
                print(">>>2 \(TimerData.list[indexCur].time)")
                cell.configure(indexCur)
            } else {
                indexCur+=1
                while(TimerData.list[indexCur].time == 0){
                    indexCur+=1;
                }
                cell.configure(indexCur)
                print(">>>3 \(TimerData.list[indexCur].time)")
            }
        }
        
       
        
        return cell
    }
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let delete = UIContextualAction(style: .normal, title: "삭제") { (UIContextualAction, UIView, success: @escaping (Bool) -> Void) in
//            print("삭제 클릭 됨")
//            TimerData.list[indexPath.row].timer.invalidate()
//
//
////            for i in indexPath.row+1..<TimerData.list.count {
////                print("curent count: \(TimerData.list.count)")
////                print("this : \(i)")
////                CurIndex.list[i].curIdx -= 1
////
////                print("CurIndex.list[i].curIdx: \(CurIndex.list[i].curIdx)")
////            }
////
//            //TimerData.list.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//            success(true)
//        }
//        delete.backgroundColor = .systemRed
//
//        //actions배열 인덱스 0이 오른쪽에 붙어서 나옴
//        return UISwipeActionsConfiguration(actions:[delete])
//    }
}
