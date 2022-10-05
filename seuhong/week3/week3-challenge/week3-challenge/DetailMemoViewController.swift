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
    
    var detailMemoList = DetailMemo.MemoList
    var index = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        detailTitle.text = detailMemoList[index].detailTitle
        detailMemo.text = detailMemoList[index].detailMemo
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        detailMemoList[index].detailTitle = detailTitle.text!
        detailMemoList[index].detailMemo = detailMemo.text!
        loadView()
        print(detailMemoList[index].detailMemo)
    }
    
    
    


}
