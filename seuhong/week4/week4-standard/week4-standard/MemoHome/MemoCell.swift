//
//  MemoCell.swift
//  week3-challenge
//
//  Created by νμΉμ on 2022/10/05.
//

import UIKit

class MemoCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configure(item: Memo){
        titleLabel.text = item.titleLabel
    }
    

}
