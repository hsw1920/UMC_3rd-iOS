//
//  MemoViewController.swift
//  week3-challenge
//
//  Created by νμΉμ on 2022/10/05.
//

import UIKit

protocol DeleteMemoProtocol {
    func deleteMemo(indexPath: IndexPath)
}

class MemoViewController: UIViewController, NewMemoProtocol, DeleteMemoProtocol {
    
    func deleteMemo(indexPath: IndexPath) {
        Memo.list.remove(at: indexPath.row)
        DetailMemo.MemoList.remove(at: indexPath.row)
        
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    @IBAction func addMemo(_ sender: UIBarButtonItem) {
        // newMemo
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "NewMemoViewController") as? NewMemoViewController else { return }
//        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("MemoHome will appear")

        tableView.reloadData()
        
        print("Table contents are reloaded")
        print("-----------------")
    }
    
    func setHome(item: Memo) {
        Memo.list.append(item)
    }
    
    func setDetail(item: DetailMemo) {
        DetailMemo.MemoList.append(item)
    }
    
}


// MARK: - extension Delegate & DataSource

extension MemoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DetailMemoViewController") as? DetailMemoViewController else { return }
        vc.delegate = self
        vc.index = indexPath
        navigationController?.pushViewController(vc, animated: true)
    }
    
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        <#code#>
//    }
 
}
extension MemoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Memo.list.count
    }
    
    
    
    // Swipe μ­μ 
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Memo.list.remove(at: indexPath.row)
            DetailMemo.MemoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MemoCell", for: indexPath) as? MemoCell else {
            return UITableViewCell()
        }
        
        
        // μ¬μ¬μ©μ λ¬Έμ  ν΄κ²° -> νΉμ  μ‘°κ±΄μμ λ³νλ₯Ό μ£Όμλ€λ©΄,
        // κ·Έ μ‘°κ±΄μ ν΄λΉνμ§ μμ λλ μ΄κΈ°νν΄μ£Όλ μ½λλ₯Ό μμ±ν΄μΌν¨.
        // λλ prepareForReuse() λ©μλλ₯Ό νμ©ν  μ μμ
        cell.prepareForReuse()
        
        if indexPath.row == 0 {
            cell.backgroundColor = .red
        }
//        else {
//            cell.backgroundColor = .systemBackground
//        }
        
        cell.configure(item: Memo.list[indexPath.row])
        return cell
    }

    
}

