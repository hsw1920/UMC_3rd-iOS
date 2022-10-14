//
//  Memo.swift
//  week3-challenge
//
//  Created by 홍승완 on 2022/10/05.
//

import Foundation

class Memo {
    var titleLabel: String
    init(titleLabel: String) {
        self.titleLabel = titleLabel
    }

    public static var list: [Memo] = [
            Memo(titleLabel: "새 메모"),
            Memo(titleLabel: "새 메모2"),
    ]

}

