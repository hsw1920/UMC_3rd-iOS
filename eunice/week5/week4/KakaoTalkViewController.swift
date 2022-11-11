//
//  KakaoTalkViewController.swift
//  week4
//
//  Created by 김민경 on 2022/10/28.
//

import UIKit
import Lottie

class KakaoTalkViewController: UIViewController, UITableViewDelegate, UITableViewDataSource { // 공식문서를 통해 각 프로토콜 조사해보기
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chattingRoomData.count // 한 섹션안에 들어갈 행의 개수 (구현해야하는 디자인의 셀의 개수) == 채팅방의 개수
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "KakaoTalkTableTableViewCell", for: indexPath) as? KakaoTalkTableTableViewCell else {return UITableViewCell() }
        
        // 몇번째 셀에 어떤것이 들어가는지 모르기때문에 indexPath활용
        cell.profileImageView.image = chattingRoomData[indexPath.row].profileImage
        cell.nameLabel.text=chattingRoomData[indexPath.row].name
        cell.lastMessageLabel.text=chattingRoomData[indexPath.row].lastMessage
        
        // memberCountLabel은 개인톡일때 없으므로 nil값이 넘어오기 때문에 옵셔널 바인딩으로 처리
        if let memberCount = chattingRoomData[indexPath.row].memberCount{
            cell.memberCountLabel.text=memberCount
        } else {
            cell.memberCountLabel.isHidden=true
        }
        
        cell.timeLabel.text=chattingRoomData[indexPath.row].time
        cell.messageCountLabel.text=chattingRoomData[indexPath.row].messageCount
        
        if indexPath.row == 0 { // 이렇게 쓰다보면 재활용이 되어 속성이 남아있게 된다. (0번째 셀일때만 빨간색이 되도록 처리해보기!)
            cell.backgroundColor = .red
        }
        
        return cell // 테이블뷰에 넣을 셀
    }
    
    // 스와이프 기능 추가
    func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration? {
        let readAction = UIContextualAction(
            style: .normal,
            title: "읽음",
            handler: {
                (action, view, completionHandler) in
                completionHandler(true)
            }
        )
        readAction.backgroundColor = .darkGray
        
        let exitAction = UIContextualAction(
            style: .destructive,
            title: "나가기",
            handler: {
                (action, view, completionHandler) in
                completionHandler(true)
            }
        )
        
        return UISwipeActionsConfiguration(actions: [exitAction, readAction])
    }
    
    
    @IBOutlet weak var kakaoTalkTableView: UITableView!
    
    let refreshControl = UIRefreshControl()
    
    lazy var lottieView: AnimationView = {
        let animationView = AnimationView(name: "refreshIndicator")
        animationView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        let centerX = UIScreen.main.bounds.width / 2
        animationView.center = CGPoint(x: centerX, y: 40)
        animationView.contentMode = .scaleAspectFit
        animationView.stop()
        animationView.isHidden = true
        return animationView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        initRefreshControl()
    }
    
    func setupTableView() {
        kakaoTalkTableView.delegate = self
        kakaoTalkTableView.dataSource = self
    }
    
    func initRefreshControl() {
        refreshControl.addSubview(lottieView)
        refreshControl.tintColor = .clear
        refreshControl.addTarget(
            self,
            action: #selector(refreshTableView(refreshControl:)),
            for: .valueChanged
        )
        
        kakaoTalkTableView.refreshControl = refreshControl
    }
    
    @objc func refreshTableView(refreshControl: UIRefreshControl) {
        print("새로고침!!")
        lottieView.isHidden = false
        lottieView.play()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.lottieView.isHidden = true
            self.lottieView.stop()
            self.kakaoTalkTableView.reloadData()
            refreshControl.endRefreshing()
        }
    }
    
    let chattingRoomData: [ChattingRoomDataModel] = [
        ChattingRoomDataModel(
            profileImage: UIImage(named: "swiftIcon"),
            name: "iOS 단톡방",
            lastMessage: "사진을 보냈습니다.",
            memberCount: "200",
            time: "오전 1:05",
            messageCount: "61"
        ),
        ChattingRoomDataModel(
            profileImage: UIImage(named: "umcIcon"),
            name: "UMC 3기 단톡방",
            lastMessage: "다들 미션 다 끝내셨나요?",
            memberCount: "15",
            time: "오전 12:31",
            messageCount: "31"
        ),
        ChattingRoomDataModel(
            profileImage: UIImage(named: "euniceIcon"),
            name: "유니스",
            lastMessage: "화이팅 해봐요!!!",
            memberCount: nil,
            time: "오전 12:02",
            messageCount: "12"
        ),
        ChattingRoomDataModel(
            profileImage: UIImage(named: "defaultProfileIcon"),
            name: "익명1",
            lastMessage: "화이팅 해봐요!!!",
            memberCount: nil,
            time: "어제",
            messageCount: "13"
        ),
        ChattingRoomDataModel(
            profileImage: UIImage(named: "defaultProfileIcon"),
            name: "익명2",
            lastMessage: "화이팅 해봐요!!!",
            memberCount: nil,
            time: "어제",
            messageCount: "15"
        ),
        ChattingRoomDataModel(
            profileImage: UIImage(named: "defaultProfileIcon"),
            name: "익명3",
            lastMessage: "화이팅 해봐요!!!",
            memberCount: nil,
            time: "어제",
            messageCount: "14"
        ),
        ChattingRoomDataModel(
            profileImage: UIImage(named: "defaultProfileIcon"),
            name: "익명4",
            lastMessage: "화이팅 해봐요!!!",
            memberCount: nil,
            time: "어제",
            messageCount: "13"
        ),
        ChattingRoomDataModel(
            profileImage: UIImage(named: "defaultProfileIcon"),
            name: "익명5",
            lastMessage: "화이팅 해봐요!!!",
            memberCount: nil,
            time: "어제",
            messageCount: "12"
        ),
        ChattingRoomDataModel(
            profileImage: UIImage(named: "defaultProfileIcon"),
            name: "익명6",
            lastMessage: "화이팅 해봐요!!!",
            memberCount: nil,
            time: "어제",
            messageCount: "10"
        ),
        ChattingRoomDataModel(
            profileImage: UIImage(named: "defaultProfileIcon"),
            name: "익명7",
            lastMessage: "화이팅 해봐요!!!",
            memberCount: nil,
            time: "어제",
            messageCount: "15"
        ),
        ChattingRoomDataModel(
            profileImage: UIImage(named: "defaultProfileIcon"),
            name: "익명8",
            lastMessage: "화이팅 해봐요!!!",
            memberCount: nil,
            time: "어제",
            messageCount: "13"
        ),
        ChattingRoomDataModel(
            profileImage: UIImage(named: "defaultProfileIcon"),
            name: "익명9",
            lastMessage: "화이팅 해봐요!!!",
            memberCount: nil,
            time: "어제",
            messageCount: "12"
        ),
        ChattingRoomDataModel(
            profileImage: UIImage(named: "defaultProfileIcon"),
            name: "익명10",
            lastMessage: "화이팅 해봐요!!!",
            memberCount: nil,
            time: "어제",
            messageCount: "12"
        ),
        ChattingRoomDataModel(
            profileImage: UIImage(named: "defaultProfileIcon"),
            name: "익명11",
            lastMessage: "화이팅 해봐요!!!",
            memberCount: nil,
            time: "어제",
            messageCount: "12"
        ),
        ChattingRoomDataModel(
            profileImage: UIImage(named: "defaultProfileIcon"),
            name: "익명12",
            lastMessage: "화이팅 해봐요!!!",
            memberCount: nil,
            time: "어제",
            messageCount: "12"
        ),
        ChattingRoomDataModel(
            profileImage: UIImage(named: "defaultProfileIcon"),
            name: "익명13",
            lastMessage: "화이팅 해봐요!!!",
            memberCount: nil,
            time: "어제",
            messageCount: "112"
        ),
        ChattingRoomDataModel(
            profileImage: UIImage(named: "defaultProfileIcon"),
            name: "익명14",
            lastMessage: "화이팅 해봐요!!!",
            memberCount: nil,
            time: "어제",
            messageCount: "12"
        )
    ]

}

struct ChattingRoomDataModel {
    let profileImage: UIImage? // 에러방지 : 옵셔널 처리
    let name: String
    let lastMessage: String
    let memberCount: String? // 있을수도있고, 없을수도 있으므로 옵셔널 타입으로 선언 (단톡방일때는 있고, 개인방일때는 없으므로)
    let time: String
    let messageCount: String
}
