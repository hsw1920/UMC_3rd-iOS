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
    
    var homeMemo = Memo.list
    var detailMemoList = DetailMemo.MemoList
    var index = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {

        detailTitle.text = detailMemoList[index].detailTitle
        detailMemo.text = detailMemoList[index].detailMemo

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //home title 변경
        homeMemo[index].titleLabel = detailTitle.text!
        //detail 변경
        detailMemoList[index].detailTitle = detailTitle.text!
        detailMemoList[index].detailMemo = detailMemo.text!
        
        
        
    }
    
    
    


}
