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
  // var jobs = [Job]() // can be done w/o Relationship macro
  // deleteRule
  // nullify deletes and leaves jobs
  // cascade will delete jobs
  @Relationship(deleteRule: .cascade) var jobs = [Job]()
    
  init(name: String, city: String, joinDate: Date) {
    self.name = name
    self.city = city
    self.joinDate = joinDate
  }
}
