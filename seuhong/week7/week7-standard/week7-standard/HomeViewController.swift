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

class HomeViewController: UIViewController, TimerProtocol {
    
    var timerIsOn: Bool = false
    
    func refreshTable(){
        self.tableView.reloadData()
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    
    @IBAction func btnTapped(_ sender: UIButton) {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as? ViewController else { return }
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        TimerData.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TimerCell") as? TimerCell else {
            return UITableViewCell()
        }

        cell.configure(indexPath.row)
        return cell
    }
    
}
