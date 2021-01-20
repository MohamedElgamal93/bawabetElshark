//
//  SupliersModel.swift
//  BawabtAlsharaq
//
//  Created by mohamed mosadik on 03/01/2021.
//  Copyright © 2021 MM. All rights reserved.
//

import Foundation

// MARK: - Vendors
struct Vendors: Codable {
    let vendors: [Vend]
    let params: Param
}

// MARK: - Params
struct Param: Codable {
    let page, itemsPerPage: Int
    let sortOrder, sortBy, sortOrderRev, totalItems: String

    enum CodingKeys: String, CodingKey {
        case page
        case itemsPerPage = "items_per_page"
        case sortOrder = "sort_order"
        case sortBy = "sort_by"
        case sortOrderRev = "sort_order_rev"
        case totalItems = "total_items"
    }
}

// MARK: - Vendor
struct Vend: Codable {
    var companyID: String
    let langCode: LangCode
    let email, company, timestamp: String
    let status: Statu
    let plan, averageRating: JSONNil?
    let companyThreadIDS: String
    let discussion: Discussion

    enum CodingKeys: String, CodingKey {
        case companyID = "company_id"
        case langCode = "lang_code"
        case email, company, timestamp, status, plan
        case averageRating = "average_rating"
        case companyThreadIDS = "company_thread_ids"
        case discussion
    }
}

// MARK: - Discussion
struct Discussion: Codable {
    let postsCount: Int

    enum CodingKeys: String, CodingKey {
        case postsCount = "posts_count"
    }
}

enum LangCode: String, Codable {
    case en = "en"
}

enum Statu: String, Codable {
    case a = "A"
}

// MARK: - Encode/decode helpers

class JSONNil: Codable, Hashable {

    public static func == (lhs: JSONNil, rhs: JSONNil) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNil.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

