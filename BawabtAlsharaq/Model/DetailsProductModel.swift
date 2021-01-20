//
//  DetailsProductModel.swift
//  BawabtAlsharaq
//
//  Created by mohamed mosadik on 03/01/2021.
//  Copyright © 2021 MM. All rights reserved.
//


import Foundation

struct Details: Codable{
    let details: [Detail]
    let mainPar: ImageDetails
    
}

struct Detail: Codable {
    let productID: Int
    let product, shortname, shortDescription, fullDescription, companyID: String
    let mainPair: Main?
   // let mainP: ImageDetails

    enum CodingKeys: String, CodingKey {
        case productID = "product_id"
        case product, shortname
        case shortDescription = "short_description"
        case fullDescription = "full_description"
        case companyID = "company_id"
        case mainPair = "main_pair"
    }
}

struct ImageDetails: Codable {
    let main: Main

    enum CodingKeys: String, CodingKey {
        case main = "main_pair"
    }
}

// MARK: - MainPair
struct Main: Codable {
    let pairID, imageID, detailedID, position: String
    let objectID, objectType: String
    let detailed: Detal

    enum CodingKeys: String, CodingKey {
        case pairID = "pair_id"
        case imageID = "image_id"
        case detailedID = "detailed_id"
        case position
        case objectID = "object_id"
        case objectType = "object_type"
        case detailed
    }
}

// MARK: - Detailed
struct Detal: Codable {
    let objectID, objectType, type: String
    let imagePath: String
    let alt, imageX, imageY: String
    let httpImagePath: String
    let httpsImagePath: String
    let absolutePath, relativePath: String
    let isHighRes: Bool

    enum CodingKeys: String, CodingKey {
        case objectID = "object_id"
        case objectType = "object_type"
        case type
        case imagePath = "image_path"
        case alt
        case imageX = "image_x"
        case imageY = "image_y"
        case httpImagePath = "http_image_path"
        case httpsImagePath = "https_image_path"
        case absolutePath = "absolute_path"
        case relativePath = "relative_path"
        case isHighRes = "is_high_res"
    }
}
