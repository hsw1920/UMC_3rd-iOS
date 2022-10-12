//
//  MemoViewController.swift
//  week3-challenge
//
//  Created by 홍승완 on 2022/10/05.
//

import UIKit

protocol DeleteMemoProtocol {
    func deleteMemo(indexPath: IndexPath)
}

class MemoViewController: UIViewController, NewMemoProtocol, DeleteMemoProtocol {
    
    func deleteMemo(indexPath: IndexPath) {
        list.remove(at: indexPath.row)
        detailList.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var list = Memo.list
    var detailList = DetailMemo.MemoList
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
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
        vc.delegate = self
        vc.index = indexPath
        vc.homeMemo = list
        vc.detailMemoList = detailList
        navigationController?.pushViewController(vc, animated: true)
    }
 
}
extension MemoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    // Swipe 삭제
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            list.remove(at: indexPath.row)
            detailList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MemoCell", for: indexPath) as? MemoCell else {
            return UITableViewCell()
        }
        
        // 재사용셀 문제 해결 -> 특정 조건에서 변화를 주었다면,
        // 그 조건에 해당하지 않을 때는 초기화해주는 코드를 작성해야함.
        // 또는 prepareForReuse() 메서드를 활용할 수 있음
        if indexPath.row == 0 {
            cell.backgroundColor = .red
        } else {
            cell.backgroundColor = .systemBackground
        }
        
        cell.configure(item: list[indexPath.row])
        return cell
    }
    
    
}

