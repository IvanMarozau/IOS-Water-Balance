//
//  WaterForDay.swift
//  WaterBalance
//
//  Created by Иван Морозов on 03.06.2022.
//

import Foundation
import SwiftUI

struct WaterForDay: Identifiable{
    var id = UUID().uuidString
    var waters: CGFloat
    var weekDay: String
}

