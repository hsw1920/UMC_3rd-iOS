//
//  DetailMemoViewController.swift
//  week3-challenge
//
//  Created by 홍승완 on 2022/10/05.
//

import UIKit

class DetailMemoViewController: UIViewController {
    @IBOutlet weak var detailTitle: UITextField!
    @IBOutlet weak var detailMemo: UITextView!
    @IBOutlet weak var favoriteBtn: UIBarButtonItem!
    
    //    var homeMemo = Memo.list
//    var detailMemoList = DetailMemo.MemoList
    var index = IndexPath()
    
    var delegate: DeleteMemoProtocol?
    
    enum CurrentState {
        case edit
        case delete
    }
    
    // 기본 edit 상태
    var state = CurrentState.edit
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("DetailVC will appear")
        
        detailTitle.text = DetailMemo.MemoList[index.row].detailTitle
        detailMemo.text = DetailMemo.MemoList[index.row].detailMemo
        if DetailMemo.MemoList[index.row].favorite == true {
            favoriteBtn.image = UIImage(systemName: "star.fill")
        }
        print("Previous contents were loaded")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("DetailVC will disappear")
        
        switch state {
        case .edit :
            print("현재는 .edit 상태")
            //title 변경
            Memo.list[index.row].titleLabel = detailTitle.text!
            
            //detail 변경
            DetailMemo.MemoList[index.row].detailTitle = detailTitle.text!
            DetailMemo.MemoList[index.row].detailMemo = detailMemo.text!
            
            
        case .delete:
            print("현재는 .delete 상태")
            delegate?.deleteMemo(indexPath: index)
            
        }
        print("Contents were modified")
        print("-----------------")
    }
    
    @IBAction func deleteBtnTapped(_ sender: UIBarButtonItem) {
        state = CurrentState.delete
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func favoriteBtnTapped(_ sender: UIBarButtonItem) {
        let favoriteState = DetailMemo.MemoList[index.row].favorite
        switch favoriteState {
        case true:
            favoriteBtn.image = UIImage(systemName: "star")
            DetailMemo.MemoList[index.row].favorite.toggle()
        case false:
            favoriteBtn.image = UIImage(systemName: "star.fill")
            DetailMemo.MemoList[index.row].favorite.toggle()
        }
    }
    
}
