//
//  KakaoTalkViewController.swift
//  week4-seminar
//
//  Created by 홍승완 on 2022/10/11.
//

import UIKit

class KakaoTalkViewController: UIViewController {
    
    let chattingRoomData: [ChattingRoomDataModel] = [
        ChattingRoomDataModel(
            profileImage: UIImage(systemName: "cloud"),
            name: "iOS 단톡방",
            lastMessage: "안녕하세요",
            memberCount: "4",
            time: "오후 3:45",
            messageCount: "100"
        ),
        ChattingRoomDataModel(
            profileImage: UIImage(systemName: "sun.max"),
            name: "홍길동ㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅁㄴㅇㅁㅇ",
            lastMessage: "ㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎ",
            memberCount: "123",
            time: "오전 03:12",
            messageCount: "3"
        ),
       
    ]
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension KakaoTalkViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chattingRoomData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "KakaoTalkTableViewCell", for: indexPath) as? KakaoTalkTableViewCell else { return UITableViewCell() }
        
        cell.configure(item: chattingRoomData[indexPath.row])
        return cell
    }
    
}

struct ChattingRoomDataModel {
    let profileImage: UIImage?
    let name: String
    let lastMessage: String
    let memberCount: String?
    let time: String
    let messageCount: String
}
