//
//  NewMemoViewController.swift
//  week3-challenge
//
//  Created by 홍승완 on 2022/10/05.
//

import UIKit

protocol NewMemoProtocol {
    func setHome(item: Memo)
    func setDetail(item: DetailMemo)
}

class NewMemoViewController: UIViewController {
    
    @IBOutlet weak var newMemoTitle: UITextField!
    @IBOutlet weak var newMemo: UITextView!
    
    var delegate: NewMemoProtocol?
    
    var memoList = Memo.list
    var detailMemoList = DetailMemo.MemoList
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("NewMemoVC will appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("NewMemoVC will disappear")
        
        // home table의 DB에 title 추가
        let saveTitle = Memo(titleLabel: newMemoTitle.text!)
        delegate?.setHome(item: saveTitle)
        
        // detail memo의 DB에 추가
        let saveDetailMemo = DetailMemo(detailTitle: newMemoTitle.text!, detailMemo: newMemo.text!)
        delegate?.setDetail(item: saveDetailMemo)
        
        print("NewMemo is saved")
        print("-----------------")
    }

}
