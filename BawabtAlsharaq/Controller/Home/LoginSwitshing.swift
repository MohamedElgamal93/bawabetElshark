//
//  LoginVendor.swift
//  BawabtAlsharaq
//
//  Created by mohamed mosadik on 09/01/2021.
//  Copyright © 2021 MM. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let loginVendor = try? newJSONDecoder().decode(LoginVendor.self, from: jsonData)

import Foundation

// MARK: - LoginSwitching
struct LoginSwitching: Codable {
    let users: [[String: String?]]
    let paramsLogin: ParamsLogin
    
    enum CodingKeys: String, CodingKey{
        case users
        case paramsLogin = "params"
    }
}

// MARK: - Params
struct ParamsLogin: Codable {
    let page, itemsPerPage: Int
    let extendedSearch: Bool
    let userType, sortOrder, sortBy, sortOrderRev: String
    let totalItems: String

    enum CodingKeys: String, CodingKey {
        case page
        case itemsPerPage = "items_per_page"
        case extendedSearch = "extended_search"
        case userType = "user_type"
        case sortOrder = "sort_order"
        case sortBy = "sort_by"
        case sortOrderRev = "sort_order_rev"
        case totalItems = "total_items"
    }
}
