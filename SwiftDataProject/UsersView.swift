//
//  UsersView.swift
//  SwiftDataProject
//
//  Created by Tim Mitra on 2023-11-27.
//

import SwiftUI
import SwiftData

struct UsersView: View {
  @Environment(\.modelContext) var modelContext
  @Query var users: [User]
  
  var body: some View {
    List(users) { user in
      HStack {
        Text(user.name)
        
        Spacer()
        
        Text(String(user.unwrappedJobs.count))
          .fontWeight(.black)
          .padding(.horizontal, 10)
          .padding(.vertical, 5)
          .background(.blue)
          .foregroundStyle(.white)
          .clipShape(.capsule )
      }
    }
    // for fun.
    //.onAppear(perform: addSample)
  }
  
  init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
    // _user lets us make a query
    _users = Query(filter: #Predicate<User> { user in
      user.joinDate >= minimumJoinDate
    }, sort: sortOrder)
  }
  
  func addSample() {
    let user1 = User(name: "Piper Chapman", city: "New York", joinDate: .now)
    let job1 = Job(name: "Organize sock drawer", priority: 3)
    let job2 = Job(name: "Make plans with Alex", priority: 4)
    // insert w/o jobs
    modelContext.insert(user1)
    // append the jobs to the user1
    user1.jobs?.append(job1)
    user1.jobs?.append(job2)
  }
}

#Preview {
  UsersView(minimumJoinDate: .now, sortOrder: [SortDescriptor(\User.name)])
    .modelContainer(for: User.self)
}
