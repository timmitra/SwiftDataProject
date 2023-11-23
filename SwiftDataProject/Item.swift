//
//  Item.swift
//  SwiftDataProject
//
//  Created by Tim Mitra on 2023-11-22.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
