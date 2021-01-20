//
//  FloatPrice.swift
//  BawabtAlsharaq
//
//  Created by mohamed mosadik on 03/01/2021.
//  Copyright © 2021 MM. All rights reserved.
//

import Foundation

extension Double {
   func round(to places: Int) -> Double {
       let divisor = pow(10.0, Double(places))
       return Darwin.round(self * divisor) / divisor
   }
}
