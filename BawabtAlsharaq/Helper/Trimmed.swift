//
//  Trimmed.swift
//  Bawabt Al sharaq
//
//  Created by mohamed mosadik on 19/12/2020.
//  Copyright © 2020 Bawabt Al sharaq. All rights reserved.
//

import Foundation
extension String{
    var trimmed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

