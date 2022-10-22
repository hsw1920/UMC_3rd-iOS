//
//  FavoriteCell.swift
//  week5-standard
//
//  Created by 홍승완 on 2022/10/21.
//

import UIKit

class FavoriteCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configure(item: DetailMemo){
        titleLabel.text = item.detailTitle
        descriptionLabel.text = item.detailMemo
    }
}
