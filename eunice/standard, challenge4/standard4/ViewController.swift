//
//  ViewController.swift
//  standard4
//
//  Created by 김민경 on 2022/10/29.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var cellCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.delegate=self
        TableView.dataSource=self
        
        TableView.layer.cornerRadius=10
        cellCountLabel.text = String(MemoData.count)
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MemoData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else {return UITableViewCell() }
        
        cell.titleLabel.text = MemoData[indexPath.row].title
        cell.contentLabel.text=MemoData[indexPath.row].content
        cell.timeLabel.text=MemoData[indexPath.row].time
                
        return cell // 테이블뷰에 넣을 셀
                
    }
    
    func tableView(_ tableView: UITableView,trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let delete = UIContextualAction(style: .normal, title: "") { [self] (_, _, success: @escaping (Bool) -> Void) in
                          // 원하는 액션 추가
                self.MemoData.remove(at: indexPath.row) // 셀 삭제될때 해당 MemoData도 같이 지워서 갯수를 맞춰줘야 오류가 나지않음.
                tableView.deleteRows(at: [indexPath], with: .fade)
                cellCountLabel.text = String(MemoData.count) // 셀 삭제될때마다 개수 업데이트
                success(true)
            }

                // 각 ContextualAction 대한 설정
                delete.backgroundColor = .systemRed
                delete.image = UIImage(systemName: "trash.fill")

               // UISwipeActionsConfiguration에 action을 추가하여 리턴
               return UISwipeActionsConfiguration(actions: [delete])
        }

    var MemoData: [MemoDataModel] = [
        MemoDataModel (
            title:"계획",
            content:"10/29 토 거북이 밥주기",
            time: "오전 12:31"
        ),
        MemoDataModel (
            title:"UMC 3기 4주차 미션",
            content:"메모장 만들기, 재사용 큐 공부",
            time: "오후 1:41"
        ),
        MemoDataModel (
            title:"인수인계",
            content:"신규이사 모집 관련",
            time: "2022. 10. 15."
        ),
        MemoDataModel (
            title:"대학생활",
            content:"3학년 -UMC 3기, 코딩테스트 준비",
            time: "2022. 9. 17."
        ),
        MemoDataModel (
            title:"IDPW",
            content:"세종대 학사정보시스템",
            time: "2022. 4. 9."
        ),
        MemoDataModel (
            title:"계획",
            content:"10/29 토 거북이 밥주기",
            time: "오전 12:31"
        ),
        MemoDataModel (
            title:"UMC 3기 4주차 미션",
            content:"메모장 만들기, 재사용 큐 공부",
            time: "오후 1:41"
        ),
        MemoDataModel (
            title:"인수인계",
            content:"신규이사 모집 관련",
            time: "2022. 10. 15."
        ),
        MemoDataModel (
            title:"대학생활",
            content:"3학년 -UMC 3기, 코딩테스트 준비",
            time: "2022. 9. 17."
        ),
        MemoDataModel (
            title:"IDPW",
            content:"세종대 학사정보시스템",
            time: "2022. 4. 9."
        ),
        MemoDataModel (
            title:"계획",
            content:"10/29 토 거북이 밥주기",
            time: "오전 12:31"
        ),
        MemoDataModel (
            title:"UMC 3기 4주차 미션",
            content:"메모장 만들기, 재사용 큐 공부",
            time: "오후 1:41"
        ),
        MemoDataModel (
            title:"인수인계",
            content:"신규이사 모집 관련",
            time: "2022. 10. 15."
        ),
        MemoDataModel (
            title:"대학생활",
            content:"3학년 -UMC 3기, 코딩테스트 준비",
            time: "2022. 9. 17."
        ),
        MemoDataModel (
            title:"IDPW",
            content:"세종대 학사정보시스템",
            time: "2022. 4. 9."
        ),
        MemoDataModel (
            title:"계획",
            content:"10/29 토 거북이 밥주기",
            time: "오전 12:31"
        ),
        MemoDataModel (
            title:"UMC 3기 4주차 미션",
            content:"메모장 만들기, 재사용 큐 공부",
            time: "오후 1:41"
        ),
        MemoDataModel (
            title:"인수인계",
            content:"신규이사 모집 관련",
            time: "2022. 10. 15."
        ),
        MemoDataModel (
            title:"대학생활",
            content:"3학년 -UMC 3기, 코딩테스트 준비",
            time: "2022. 9. 17."
        ),
        MemoDataModel (
            title:"IDPW",
            content:"세종대 학사정보시스템",
            time: "2022. 4. 9."
        ),
        MemoDataModel (
            title:"계획",
            content:"10/29 토 거북이 밥주기",
            time: "오전 12:31"
        ),
        MemoDataModel (
            title:"UMC 3기 4주차 미션",
            content:"메모장 만들기, 재사용 큐 공부",
            time: "오후 1:41"
        ),
        MemoDataModel (
            title:"인수인계",
            content:"신규이사 모집 관련",
            time: "2022. 10. 15."
        ),
        MemoDataModel (
            title:"대학생활",
            content:"3학년 -UMC 3기, 코딩테스트 준비",
            time: "2022. 9. 17."
        ),
        MemoDataModel (
            title:"IDPW",
            content:"세종대 학사정보시스템",
            time: "2022. 4. 9."
        ),
    ]
}

struct MemoDataModel {
    let title: String
    let content: String
    let time: String
}
