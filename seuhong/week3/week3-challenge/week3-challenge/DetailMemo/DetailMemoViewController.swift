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
        
        print("Previous contents were loaded")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("DetailVC will disappear")
        
        switch state {
        case .edit :
            print("현재는 편집상태임")
            //title 변경
            Memo.list[index.row].titleLabel = detailTitle.text!
            
            //detail 변경
            DetailMemo.MemoList[index.row].detailTitle = detailTitle.text!
            DetailMemo.MemoList[index.row].detailMemo = detailMemo.text!
            
            
        case .delete:
            print("현재는 삭제된 상태")
            delegate?.deleteMemo(indexPath: index)
            
        }
        print("Contents were modified")
        print("-----------------")
    }
    
    @IBAction func deleteBtnTapped(_ sender: UIBarButtonItem) {
        state = CurrentState.delete
        self.navigationController?.popViewController(animated: true)
    }
}
