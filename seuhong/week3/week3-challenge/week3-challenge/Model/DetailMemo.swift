//
//  DetailMemo.swift
//  week3-challenge
//
//  Created by 홍승완 on 2022/10/05.
//

import Foundation

class DetailMemo {
    var detailTitle: String
    var detailMemo: String
    init(detailTitle: String, detailMemo: String) {
        self.detailTitle = detailTitle
        self.detailMemo = detailMemo
    }
    static var MemoList: [DetailMemo] = [
        DetailMemo(detailTitle: "새 메모", detailMemo: "메모"),
        DetailMemo(detailTitle: "새 메모2", detailMemo: "메모2"),
        
    ]
}
