//
//  KakaoTalkTableViewCell.swift
//  week4-seminar
//
//  Created by 홍승완 on 2022/10/11.
//

import UIKit

class KakaoTalkTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastMessageLabel: UILabel!
    @IBOutlet weak var memberCountLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var messageCountBackgroundView: UIView!
    @IBOutlet weak var messageCountLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.layer.cornerRadius = 17.5
        messageCountBackgroundView.layer.cornerRadius = 12.5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(item : ChattingRoomDataModel) {
        profileImageView.image = item.profileImage
        nameLabel.text = item.name
        lastMessageLabel.text = item.lastMessage
        
        if let memberCnt = item.memberCount {
            memberCountLabel.text = memberCnt
        } else {
            memberCountLabel.isHidden = true
        }
        
        //memberCountLabel.text = item.memberCount
        timeLabel.text = item.time
        messageCountLabel.text = item.messageCount
    }

}
