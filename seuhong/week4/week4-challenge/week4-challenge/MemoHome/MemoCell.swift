//
//  MemoCell.swift
//  week3-challenge
//
//  Created by 홍승완 on 2022/10/05.
//

import UIKit

class MemoCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var favoriteImg: UIImageView!
    
    var index = IndexPath()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    override func prepareForReuse() {
        self.backgroundColor = .systemBackground
    }
    
    func configure(item: Memo){
        titleLabel.text = item.titleLabel
        if DetailMemo.MemoList[index.row].favorite == true {
            favoriteImg.isHidden = false
        } else {
            favoriteImg.isHidden = true
        }
    }

}
