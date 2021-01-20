//
//  CategoryModel.swift
//  Bawabt Al sharaq
//
//  Created by mohamed mosadik on 18/11/2020.
//  Copyright © 2020 Bawabt Al sharaq. All rights reserved.
//

import Foundation

// MARK: - Category
struct CategoriesModel: Codable {
    let categories: [CategoryElement]
    let params: Paramies
}

// MARK: - CategoryElement
struct CategoryElement: Codable {
    var categoryID, parentID, idPath, category: String
    let position: String
    let status: Statues
    let productCount: String

    enum CodingKeys: String, CodingKey {
        case categoryID = "category_id"
        case parentID = "parent_id"
        case idPath = "id_path"
        case category, position, status
        case productCount = "product_count"
    }
}

enum Statues: String, Codable {
    case a = "A"
    case d = "D"
}

// MARK: - Params
struct Paramies: Codable {
    let categoryID: Int
    let visible: Bool
    let currentCategoryID: Int
    let simple, plain: Bool
    let limit: Int
    let itemIDS: String
    let groupByLevel, getImages: Bool
    let categoryDelimiter: String
    let getFrontendUrls: Bool
    let getCompanyName: Bool
    let itemsPerPage, page, exceptID: Int
    let sortOrder, sortBy, sortOrderRev, totalItems: String

    enum CodingKeys: String, CodingKey {
        case categoryID = "category_id"
        case visible
        case currentCategoryID = "current_category_id"
        case simple, plain, limit
        case itemIDS = "item_ids"
        case groupByLevel = "group_by_level"
        case getImages = "get_images"
        case categoryDelimiter = "category_delimiter"
        case getFrontendUrls = "get_frontend_urls"
        case getCompanyName = "get_company_name"
        case itemsPerPage = "items_per_page"
        case page
        case exceptID = "except_id"
        case sortOrder = "sort_order"
        case sortBy = "sort_by"
        case sortOrderRev = "sort_order_rev"
        case totalItems = "total_items"
    }
}
