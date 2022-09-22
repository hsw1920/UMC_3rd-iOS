//
//  DataCell.swift
//  week1-challenge
//
//  Created by 홍승완 on 2022/09/21.
//

import UIKit

class DataCell: UITableViewCell {

    
    @IBOutlet weak var subjectName: UILabel!
    @IBOutlet weak var subjectType: UILabel!
    @IBOutlet weak var professorName: UILabel!
    @IBOutlet weak var attendance: UILabel!
    @IBOutlet weak var lectureRoom: UILabel!
    @IBOutlet weak var lectureTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(_ item : ClassList){
        subjectName.text = item.subjectName
        subjectType.text = item.subjectType
        professorName.text = item.professorName
        attendance.text = item.attendance
        lectureRoom.text = item.lectureRoom
        lectureTime.text = item.lectureTime
    }
    
}
