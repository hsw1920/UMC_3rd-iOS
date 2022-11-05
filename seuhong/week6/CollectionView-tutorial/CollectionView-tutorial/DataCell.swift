//
//  DataCell.swift
//  CollectionView-tutorial
//
//  Created by 홍승완 on 2022/11/04.
//

import UIKit

class DataCell: UICollectionViewCell {
        
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = UIColor.systemIndigo
        contentView.layer.cornerRadius = 10
    }
    func configure(_ item : Data) {
        titleLabel.text = item.title
        thumbnailImageView.image = UIImage(systemName: item.imageName)?.withRenderingMode(.alwaysOriginal)
    }
}
