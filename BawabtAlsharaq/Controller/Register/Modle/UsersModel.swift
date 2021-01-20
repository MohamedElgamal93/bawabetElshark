//
//  UsersModel.swift
//  Bawabt Al sharaq
//
//  Created by mohamed mosadik on 20/12/2020.
//  Copyright © 2020 Bawabt Al sharaq. All rights reserved.
//

import Foundation

// MARK: - ModelOfUser
struct UsersModel: Codable {
    let users: [[String: String?]]
    let paramsUsers: ParamsUsers
    
    enum CodingKeys: String, CodingKey {
        case users
        case paramsUsers = "params"
    }
}

// MARK: - Params
struct ParamsUsers: Codable {
    let page, itemsPerPage: Int
    let extendedSearch: Bool
    let sortOrder, sortBy, sortOrderRev, totalItems: String

    enum CodingKeys: String, CodingKey {
        case page
        case itemsPerPage = "items_per_page"
        case extendedSearch = "extended_search"
        case sortOrder = "sort_order"
        case sortBy = "sort_by"
        case sortOrderRev = "sort_order_rev"
        case totalItems = "total_items"
    }
}
