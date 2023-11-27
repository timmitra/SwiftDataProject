//
//  Job.swift
//  SwiftDataProject
//
//  Created by Tim Mitra on 2023-11-27.
//

import Foundation
import SwiftData

@Model
class Job {
  var name: String = "None"
  var priority: Int = 1
  var owner: User?
  
  init(name: String, priority: Int, owner: User? = nil) {
    self.name = name
    self.priority = priority
    self.owner = owner
  }
}
