// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let dataModel = try? newJSONDecoder().decode(DataModel.self, from: jsonData)

import Foundation

// MARK: - DataModel
struct DataModel: Codable {
    let body: [Body]
    let header: Header
}

// MARK: - Body
struct Body: Codable {
    let routeStdIdntfc: Int
    let routeNo: String
    let routeStle, routeSE, routeTy, cdpntIdntfr: Int
    let tmnlIdntfr, pktmCaralcIntrvl, nonPktmCaralcIntrvl: Int
    let routeLt: Double
    let routeReformNo, routeStuatnReformNo: String
    let cmptofc: Cmptofc
    let opratBgnde, opratEndde, routeNm: String

    enum CodingKeys: String, CodingKey {
        case routeStdIdntfc = "route_std_idntfc"
        case routeNo = "route_no"
        case routeStle = "route_stle"
        case routeSE = "route_se"
        case routeTy = "route_ty"
        case cdpntIdntfr = "cdpnt_idntfr"
        case tmnlIdntfr = "tmnl_idntfr"
        case pktmCaralcIntrvl = "pktm_caralc_intrvl"
        case nonPktmCaralcIntrvl = "non_pktm_caralc_intrvl"
        case routeLt = "route_lt"
        case routeReformNo = "route_reform_no"
        case routeStuatnReformNo = "route_stuatn_reform_no"
        case cmptofc
        case opratBgnde = "oprat_bgnde"
        case opratEndde = "oprat_endde"
        case routeNm = "route_nm"
    }
}

enum Cmptofc: String, Codable {
    case 구미시 = "구미시"
}

// MARK: - Header
struct Header: Codable {
    let pageNo: Int
    let resultCode: String
    let totalCount, numOfRows: Int
    let resultMsg: String
}
