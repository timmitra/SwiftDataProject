//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by Tim Mitra on 2023-11-22.
//

import SwiftUI
import SwiftData

struct ContentView: View {
  @Environment(\.modelContext) private var modelContext
  @State private var showingUpcomingOnly = false
  @State private var sortOrder = [
    SortDescriptor(\User.name),
    SortDescriptor(\User.joinDate)
  ]
  
  var body: some View {
    NavigationStack {
      UsersView(minimumJoinDate: showingUpcomingOnly ? .now : .distantPast, sortOrder: sortOrder)
      .navigationTitle("Users")
      .toolbar {
        Button("Add Samples", systemImage: "plus.square.on.square") {
          // clear out data
          try? modelContext.delete(model: User.self)
          
          let first = User(name: "Ed Sheeran", city: "London", joinDate: .now.addingTimeInterval(86400 * -10))
          let second = User(name: "Rosa Diaz", city: "New York", joinDate: .now.addingTimeInterval(86400 * -5))
          let third = User(name: "Roy Kent", city: "London", joinDate: .now.addingTimeInterval(86400 * 5))
          let fourth = User(name: "Johnny English", city: "London", joinDate: .now.addingTimeInterval(86400 * 10))
          modelContext.insert(first)
          modelContext.insert(second)
          modelContext.insert(third)
          modelContext.insert(fourth)
        }
        Button(showingUpcomingOnly ? "Show Everyone" : "Show upcoming") {
          showingUpcomingOnly.toggle()
        }
        Menu("Sort", systemImage: "arrow.up.arrow.down") {
          Picker("Sort", selection: $sortOrder) {
            Text("Sort by Name")
              .tag([
                SortDescriptor(\User.name),
                SortDescriptor(\User.joinDate)
              ])
            Text("Sort by Join Date")
              .tag([
                SortDescriptor(\User.joinDate),
                SortDescriptor(\User.name)
              ])
          }
        }
      }
    }
  }
}


#Preview {
    ContentView()
        .modelContainer(for: User.self, inMemory: true)
}
