//
//  ViewController.swift
//  week1-challenge
//
//  Created by 홍승완 on 2022/09/21.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    let list = ClassList.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell", for: indexPath) as? DataCell else {
            return UITableViewCell()
        }
        let item = list[indexPath.row]
        print(indexPath.row)
        cell.configure(item)
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
}
