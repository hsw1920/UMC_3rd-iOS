// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let dataModel = try? newJSONDecoder().decode(DataModel.self, from: jsonData)

import Foundation

// MARK: - DataModel
struct DataModel: Decodable {
    let response: Response
}

// MARK: - Response
struct Response: Decodable {
    let header: Header
    let body: Body
}

// MARK: - Body
struct Body: Decodable {
    let items: Items
    let numOfRows, pageNo, totalCount: Int
}

// MARK: - Items
struct Items: Decodable {
    let item: [Item]
}

// MARK: - Item
struct Item: Decodable {
    let subwayRouteName, subwayStationID, subwayStationName: String

    enum CodingKeys: String, CodingKey {
        case subwayRouteName
        case subwayStationID = "subwayStationId"
        case subwayStationName
    }
}

// MARK: - Header
struct Header: Decodable {
    let resultCode, resultMsg: String
}
