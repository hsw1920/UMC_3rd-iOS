//
//  Memo.swift
//  week3-challenge
//
//  Created by 홍승완 on 2022/10/05.
//

import Foundation

class Memo {
    let titleLabel: String
    init(titleLabel: String) {
        self.titleLabel = titleLabel
    }

    static var list: [Memo] = [
            Memo(titleLabel: "First"),
            Memo(titleLabel: "Second"),
            Memo(titleLabel: "Third"),
            Memo(titleLabel: "Four"),
    ]

}

