//
//  ProductVendor.swift
//  BawabtAlsharaq
//
//  Created by mohamed mosadik on 03/01/2021.
//  Copyright © 2021 MM. All rights reserved.
//

import Foundation

// MARK: - ProductVendor
struct ProductOfVendor: Codable {
    let products: [Product]
    let params: Para
}

// MARK: - Params
struct Para: Codable {
    let area: String
    let useCaching: Bool
    let extend: [String]
    let customExtend: [JSONAy]
    let pname, pshort, pfull, pkeywords: String
    let feature: [JSONAy]
    let type: String
    let page: Int
    let action: String
    let filterVariants: [JSONAy]
    let featuresHash: String
    let limit, bid: Int
    let match: String
    let tracking: [JSONAy]
    let getFrontendUrls: Bool
    let itemsPerPage: Int
    let applyDisabledFilters: String
    let loadProductsExtraData: Bool
    let storefront: JSONNll?
    let sortBy, sortOrder: String
    let includeChildVariations, groupChildVariations: Bool
    let sortOrderRev, totalItems: String

    enum CodingKeys: String, CodingKey {
        case area
        case useCaching = "use_caching"
        case extend
        case customExtend = "custom_extend"
        case pname, pshort, pfull, pkeywords, feature, type, page, action
        case filterVariants = "filter_variants"
        case featuresHash = "features_hash"
        case limit, bid, match, tracking
        case getFrontendUrls = "get_frontend_urls"
        case itemsPerPage = "items_per_page"
        case applyDisabledFilters = "apply_disabled_filters"
        case loadProductsExtraData = "load_products_extra_data"
        case storefront
        case sortBy = "sort_by"
        case sortOrder = "sort_order"
        case includeChildVariations = "include_child_variations"
        case groupChildVariations = "group_child_variations"
        case sortOrderRev = "sort_order_rev"
        case totalItems = "total_items"
    }
}

// MARK: - Product
struct ProductVendor: Codable {
    let productID, product, productType, parentProductID: String
    let productCode, status, companyID, listPrice: String
    let amount, weight, length, width: String
    let height, shippingFreight, lowAvailLimit, timestamp: String
    let updatedTimestamp, usergroupIDS, isEdp, edpShipping: String
    let unlimitedDownload, tracking, freeShipping, zeroPriceAction: String
    let isPbp, isOp, isOper, isReturnable: String
    let returnPeriod, availSince, outOfStockActions, localization: String
    let minQty, maxQty, qtyStep, listQtyCount: String
    let taxIDS, ageVerification, ageLimit, optionsType: String
    let exceptionsType, detailsLayout, shippingParams, facebookObjType: String
    let buyNowURL, price: String
    let categoryIDS: [Int]
    let averageRating: JSONNll?
    let discussionType, discussionThreadID: String
    let mainCategory: Int
    let mainPair: MPair?
    let abVGVideos: Bool
    let variationFeatures: [JSONAy]
    let basePrice: String
    let selectedOptions: [JSONAy]
    let hasOptions: Bool
    let productOptions: [JSONAy]
    let discounts: Discount
    let productFeatures, qtyContent: [JSONAy]
    let premoderationReason: String

    enum CodingKeys: String, CodingKey {
        case mainPair = "main_pair"
        case productID = "product_id"
        case product
        case productType = "product_type"
        case parentProductID = "parent_product_id"
        case productCode = "product_code"
        case status
        case companyID = "company_id"
        case listPrice = "list_price"
        case amount, weight, length, width, height
        case shippingFreight = "shipping_freight"
        case lowAvailLimit = "low_avail_limit"
        case timestamp
        case updatedTimestamp = "updated_timestamp"
        case usergroupIDS = "usergroup_ids"
        case isEdp = "is_edp"
        case edpShipping = "edp_shipping"
        case unlimitedDownload = "unlimited_download"
        case tracking
        case freeShipping = "free_shipping"
        case zeroPriceAction = "zero_price_action"
        case isPbp = "is_pbp"
        case isOp = "is_op"
        case isOper = "is_oper"
        case isReturnable = "is_returnable"
        case returnPeriod = "return_period"
        case availSince = "avail_since"
        case outOfStockActions = "out_of_stock_actions"
        case localization
        case minQty = "min_qty"
        case maxQty = "max_qty"
        case qtyStep = "qty_step"
        case listQtyCount = "list_qty_count"
        case taxIDS = "tax_ids"
        case ageVerification = "age_verification"
        case ageLimit = "age_limit"
        case optionsType = "options_type"
        case exceptionsType = "exceptions_type"
        case detailsLayout = "details_layout"
        case shippingParams = "shipping_params"
        case facebookObjType = "facebook_obj_type"
        case buyNowURL = "buy_now_url"
        case price
        case categoryIDS = "category_ids"
        case averageRating = "average_rating"
        case discussionType = "discussion_type"
        case discussionThreadID = "discussion_thread_id"
        case mainCategory = "main_category"
        case abVGVideos = "ab__vg_videos"
        case variationFeatures = "variation_features"
        case basePrice = "base_price"
        case selectedOptions = "selected_options"
        case hasOptions = "has_options"
        case productOptions = "product_options"
        case discounts
        case productFeatures = "product_features"
        case qtyContent = "qty_content"
        case premoderationReason = "premoderation_reason"
    }
}

// MARK: - Discounts
struct Discount: Codable {
    let a, p: Int

    enum CodingKeys: String, CodingKey {
        case a = "A"
        case p = "P"
    }
}
struct MPair: Codable {
    let pairID, imageID, detailedID, position: String
    let objectID: String
    let objectType: SortBy
    let detailed: DetailedVend

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
struct DetailedVend: Codable {
    let objectID: String
    let objectType: SortBy
    let type: TypeEnum
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
// MARK: - Encode/decode helpers

class JSONNll: Codable, Hashable {

    public static func == (lhs: JSONNll, rhs: JSONNll) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNll.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKEy: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAy: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNll()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNll()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNll()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNll {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNll {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNll {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}

