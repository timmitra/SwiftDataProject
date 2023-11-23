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
  // using predicate macro
  @Query(filter: #Predicate<User>{ user in
    user.name.localizedStandardContains("R") &&
    user.city == "London"
  }, sort: \User.name) var users: [User]
  @State private var path = [User]()

  var body: some View {
    NavigationStack(path: $path) {
      List(users) { user in
        NavigationLink(value: user) {
          Text(user.name)
        }
      }
      .navigationTitle("Users")
      .navigationDestination(for: User.self) { user in
        EditUserView(user: user)
      }
      .toolbar {
        Button("Add User", systemImage: "plus") {
          let user = User(name: "", city: "", joinDate: .now)
          modelContext.insert(user)
          path = [user]
        }
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
      }
    }
  }
}


#Preview {
    ContentView()
        .modelContainer(for: User.self, inMemory: true)
}
