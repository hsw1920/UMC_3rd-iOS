//
//  MemoViewController.swift
//  week3-challenge
//
//  Created by 홍승완 on 2022/10/05.
//

import UIKit

class MemoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let list = Memo.list
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

    }
    

}

extension MemoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DetailMemoViewController") as? DetailMemoViewController else { return }
        vc.index = indexPath.row
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
extension MemoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MemoCell", for: indexPath) as? MemoCell else {
            return UITableViewCell()
        }
        cell.configure(item: list[indexPath.row])
        return cell
    }
    
    
}

