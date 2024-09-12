//
//  ProfileView.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 06/09/24.
//

import SwiftUI

struct ProfileView: View {
  let user: User

  @State private var isEditing = false

  var body: some View {
    ScrollView {
      Header(user: user)
        .role(isMainUser ? .primary : .secondary)
      Text(user.aboutMe ?? "")
        .padding(.top, 16)
        .padding(.horizontal, 20)
    }
    .navigationTitle(Text("Profile"))
    .toolbar {
      ToolbarItem(placement: .primaryAction) {
        if isMainUser {
          Button(action: { isEditing = true }) {
            Text("Edit")
          }
        }
      }
    }
    .fullScreenCover(isPresented: $isEditing) {
      NavigationStack {
        EditProfileView(user: user, onEditingFinished: { isEditing = false })
      }
    }
  }
}

private extension ProfileView {
  var isMainUser: Bool {
    user.id == 0
  }
}

// MARK: - Header

private extension ProfileView {
  struct Header: View {
    let name: String
    let reputation: Int
    let profileImageURL: URL?

    var body: some View {
      VStack(spacing: 4) {
        AsyncProfileImage(url: profileImageURL)
          .frame(width: 144, height: 144)
        Text(name)
          .font(.title)
          .bold()
          .padding(.top, 12)
        Text("\(reputation.formatted()) reputation")
          .font(.headline)
      }
      .frame(maxWidth: .infinity)
      .padding(.vertical, 24)
      .styled(isRounded: false)
    }
  }
}

private extension ProfileView.Header {
  init(user: User) {
    self.init(
      name: user.name,
      reputation: user.reputation,
      profileImageURL: user.profileImageURL
    )
  }
}

// MARK: - Previews

#Preview {
  NavigationStack {
    ProfileView(user: .preview)
  }
}

#Preview("Header", traits: .sizeThatFitsLayout) {
  VStack {
    ProfileView.Header(user: .preview)
    ProfileView.Header(user: .preview)
      .role(.secondary)
  }
}
