//
//  DataModel.swift
//  week9-standard-1
//
//  Created by 홍승완 on 2022/11/22.
//

import Foundation


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let dataModel = try? newJSONDecoder().decode(DataModel.self, from: jsonData)


// Codable을 Decodable로 바꿔주는 이유? Encodable할 필요가 없으므로
// Codable은 인코드와 디코드 둘을 모두 포함함 -> 구현하는 기능에 맞게 설정하는것이 개발속도가 빠름!

// MARK: - DataModel
struct DataModel: Codable {
    let header: [Header]
    let body: [Body]
}

// MARK: - Body
struct Body: Codable {
    let id, ysYear, ysMonth, dongCode: String
    let dongName: String
    let indstLCD: IndstLCD
    let indstLName: IndstLName
    let amtPer: String

    enum CodingKeys: String, CodingKey {
        case id
        case ysYear = "YS_YEAR"
        case ysMonth = "YS_MONTH"
        case dongCode = "DONG_CODE"
        case dongName = "DONG_NAME"
        case indstLCD = "INDST_L_CD"
        case indstLName = "INDST_L_NAME"
        case amtPer = "AMT_PER"
    }
}

enum IndstLCD: String, Codable {
    case c = "C"
    case f = "F"
    case g = "G"
    case h = "H"
    case i = "I"
}

enum IndstLName: String, Codable {
    case 건설업4142 = "건설업(41-42)"
    case 도매및소매업4547 = "도매 및 소매업(45-47)"
    case 숙박및음식점업5556 = "숙박 및 음식점업(55-56)"
    case 운수및창고업4952 = "운수 및 창고업(49-52)"
    case 제조업1034 = "제조업(10-34)"
}

// MARK: - Header
struct Header: Codable {
    let resultCode, totalCount, resultMsg: String
}
