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
  @StateObject private var model: Model
  @EnvironmentObject private var userController: UserController

  init(user: User) {
    self.user = user
    self._model = .init(wrappedValue: Model(user: user))
  }

  var body: some View {
    Content(user: displayedUser)
      .navigationTitle(Text("Profile"))
      .role(isMainUser ? .primary : .secondary)
      .loading(model.isLoading)
      .errorAlert(isPresented: $model.showError)
      .task {
        guard !isMainUser else { return }
        await model.loadAboutMe()
      }
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

// MARK: - Content

private extension ProfileView {
  struct Content: View {
    let user: User

    var body: some View {
      ScrollView {
        Header(user: user)
        Text(user.aboutMe ?? "")
          .padding(.top, 16)
          .padding(.horizontal, 20)
      }
    }
  }
}

private extension ProfileView {
  var isMainUser: Bool {
    user.id == userController.mainUser.id
  }

  var displayedUser: User {
    isMainUser ? userController.mainUser : model.user
  }
}

// MARK: - Header

private extension ProfileView.Content {
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

private extension ProfileView.Content.Header {
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
    ProfileView.Content.Header(user: .preview)
    ProfileView.Content.Header(user: .preview)
      .role(.secondary)
  }
}
