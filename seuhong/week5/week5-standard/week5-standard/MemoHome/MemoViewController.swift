//
//  MemoViewController.swift
//  week3-challenge
//
//  Created by 홍승완 on 2022/10/05.
//

import UIKit
import Lottie

protocol DeleteMemoProtocol {
    func deleteMemo(indexPath: IndexPath)
}

class MemoViewController: UIViewController, NewMemoProtocol, DeleteMemoProtocol {

    private let popUpFavoriteStar: LottieAnimationView = {
        let lottieView = LottieAnimationView(name: "favoriteStar")
        lottieView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        return lottieView
    }()
    
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
    
    func playFavoritePopUp() -> (Void) {
        // 전체화면을 어둡게 할 backgroundView를 생성하고
        lazy var sampleSuperview: UIView = {
            let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: view.bounds.width, height: view.bounds.height)))
            view.backgroundColor = .gray
            view.alpha = 0.8
            return view
        }()
        
        // 어두워진 화면위에 Lottie Animation을 넣음
        self.view.addSubview(sampleSuperview)
        sampleSuperview.addSubview(self.popUpFavoriteStar)
        
        self.popUpFavoriteStar.loopMode = .playOnce
        self.popUpFavoriteStar.center = self.view.center
        self.popUpFavoriteStar.contentMode = .scaleAspectFit
        self.popUpFavoriteStar.play { finished in
            self.popUpFavoriteStar.stop()
            
            self.tableView.backgroundColor = UIColor(white: 1, alpha: 1)
            
            self.popUpFavoriteStar.removeFromSuperview()
            sampleSuperview.removeFromSuperview()
        }
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
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .normal, title: nil) { (UIContextualAction, UIView, success: @escaping (Bool) ->Void) in
            Memo.list.remove(at: indexPath.row)
            DetailMemo.MemoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        delete.backgroundColor = .red
        delete.image = UIImage(systemName: "trash")
        
        let favorite = UIContextualAction(style: .normal, title: nil) { (UIContextualAction, UIView, success: @escaping (Bool) -> Void) in

            // false에서 toggle 되었을때만 실행
            if(DetailMemo.MemoList[indexPath.row].favorite == false){
                self.playFavoritePopUp()
            }
            
            DetailMemo.MemoList[indexPath.row].favorite.toggle()
            tableView.reloadData()
        }
        favorite.backgroundColor = .systemYellow
        favorite.image = UIImage(systemName: "star.fill")
        
        return UISwipeActionsConfiguration(actions: [delete,favorite])
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//            if editingStyle == .delete {
//                print("삭제됨")
//            }
//    }
}
extension MemoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Memo.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MemoCell", for: indexPath) as? MemoCell else {
            return UITableViewCell()
        }
        
        
        // 재사용셀 문제 해결 -> 특정 조건에서 변화를 주었다면,
        // 그 조건에 해당하지 않을 때는 초기화해주는 코드를 작성해야함.
        // 또는 prepareForReuse() 메서드를 활용할 수 있음
        cell.prepareForReuse()
        
        if indexPath.row == 0 {
//            cell.backgroundColor = .red
        }
//        else {
//            cell.backgroundColor = .systemBackground
//        }
        cell.index = indexPath
        cell.configure(item: Memo.list[indexPath.row])
        return cell
    }

    
}
