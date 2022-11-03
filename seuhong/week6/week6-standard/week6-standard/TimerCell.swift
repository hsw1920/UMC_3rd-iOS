//
//  TimerCell.swift
//  week6-standard
//
//  Created by 홍승완 on 2022/11/03.
//

import UIKit

class TimerCell: UITableViewCell {

    @IBOutlet weak var commonLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func timeFormatter(time : Int) -> String{
        let hours = Int(time) / 60 / 60
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    func configure(_ item: Int) {
        commonLabel.text = "남은시간"
        timeLabel.text = timeFormatter(time: TimerData.list[item].time)

    }

}
