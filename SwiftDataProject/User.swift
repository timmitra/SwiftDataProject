//
//  Item.swift
//  SwiftDataProject
//
//  Created by Tim Mitra on 2023-11-22.
//

import Foundation
import SwiftData

@Model
final class User {
  var name: String
  var city: String
    var joinDate: Date
    
  init(name: String, city: String, joinDate: Date) {
    self.name = name
    self.city = city
    self.joinDate = joinDate
  }
}
