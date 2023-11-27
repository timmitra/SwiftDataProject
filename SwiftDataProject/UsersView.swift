//
//  UsersView.swift
//  SwiftDataProject
//
//  Created by Tim Mitra on 2023-11-27.
//

import SwiftUI
import SwiftData

struct UsersView: View {
  @Query var users: [User]
  
  var body: some View {
    List(users) { user in
      HStack {
        Text(user.name)
        
        Spacer()
        
        Text(String(user.jobs.count))
          .fontWeight(.black)
          .padding(.horizontal, 10)
          .padding(.vertical, 5)
          .background(.blue)
          .foregroundStyle(.white)
          .clipShape(.capsule )
      }
    }
  }
  
  init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
    // _user lets us make a query
    _users = Query(filter: #Predicate<User> { user in
      user.joinDate >= minimumJoinDate
    }, sort: sortOrder)
  }
}

#Preview {
  UsersView(minimumJoinDate: .now, sortOrder: [SortDescriptor(\User.name)])
    .modelContainer(for: User.self)
}
