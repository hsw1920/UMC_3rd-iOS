//
//  ClassList.swift
//  week1-challenge
//
//  Created by 홍승완 on 2022/09/21.
//

import Foundation

class ClassList {
    var subjectName: String!
    var subjectType: String!
    var professorName: String!
    var attendance: String!
    var lectureRoom: String!
    var lectureTime: String!
    
    init(subjectName: String, subjectType: String, professorName: String, attendance: String, lectureRoom: String, lectureTime: String) {
        self.subjectName = subjectName
        self.subjectType = subjectType
        self.professorName = professorName
        self.attendance = attendance
        self.lectureRoom = lectureRoom
        self.lectureTime = lectureTime
    }
    
    static var list: [ClassList] = [
        ClassList(subjectName: "이산수학및프로그래밍", subjectType: "일반강의", professorName: "서재규", attendance: "퇴실OFF", lectureRoom: "센B204 (센B204)", lectureTime: "09:00~12:00"),
        ClassList(subjectName: "대학영어", subjectType: "일반강의", professorName: "Mark Collen", attendance: "퇴실OFF", lectureRoom: "Lab-B (군501)", lectureTime: "12:00~14:00"),
        ClassList(subjectName: "보컬트레이닝-001", subjectType: "일반강의", professorName: "김성경", attendance: "퇴실OFF", lectureRoom: "충B107 (충B07)", lectureTime: "15:00~18:00"),
        ClassList(subjectName: "수요집현강좌", subjectType: "일반강의", professorName: "김철수", attendance: "퇴실OFF", lectureRoom: "학대공연장 (학B01)", lectureTime: "18:00~19:30"),
            
    ]
}


