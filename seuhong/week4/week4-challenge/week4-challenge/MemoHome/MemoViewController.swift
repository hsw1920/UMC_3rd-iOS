//
//  MemoViewController.swift
//  week3-challenge
//
//  Created by 홍승완 on 2022/10/05.
//

import UIKit

class MemoViewController: UIViewController, NewMemoProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    
    var list = Memo.list
    var detailList = DetailMemo.MemoList
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        //tableView.reloadData()
    }
    
    @IBAction func addMemo(_ sender: UIBarButtonItem) {
        // newMemo
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "NewMemoViewController") as? NewMemoViewController else { return }
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("MemoHome will appear")
        tableView.reloadData()
        print("Table contents are reloaded")
        print("-----------------")
    }
    
    func setHome(item: Memo) {
        list.append(item)
    }
    
    func setDetail(item: DetailMemo) {
        detailList.append(item)
    }
    
}


// MARK: - extension Delegate & DataSource

extension MemoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DetailMemoViewController") as? DetailMemoViewController else { return }
        
        vc.index = indexPath.row
        vc.homeMemo = list
        vc.detailMemoList = detailList
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

