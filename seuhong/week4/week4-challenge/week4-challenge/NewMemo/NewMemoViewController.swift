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
    
    //var delegate: NewMemoProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("NewMemoVC will appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("NewMemoVC will disappear")
        
        // DB에 title 추가
        let saveTitle = Memo(titleLabel: newMemoTitle.text!)
        // DB에 detailMemo 추가
        let saveDetailMemo = DetailMemo(detailTitle: newMemoTitle.text!, detailMemo: newMemo.text!)
        
        Memo.list.append(saveTitle)
        DetailMemo.MemoList.append(saveDetailMemo)
        
        print("NewMemo is saved")
        print("-----------------")
    }

}
