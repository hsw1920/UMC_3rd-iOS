//
//  KakaoTalkTableTableViewCell.swift
//  week4
//
//  Created by 김민경 on 2022/10/29.
//

import UIKit

class KakaoTalkTableTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var lastMessageLabel: UILabel!
    @IBOutlet weak var memberCountLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageCountLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var messageCountBackgroundView: UIView!
    
    // ViewDidLoad() method와 동일하다고 보면됨.
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.layer.cornerRadius=22
        messageCountBackgroundView.layer.cornerRadius=10
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.backgroundColor = nil //. white로 적어도 상관없음.
    }
    

}
