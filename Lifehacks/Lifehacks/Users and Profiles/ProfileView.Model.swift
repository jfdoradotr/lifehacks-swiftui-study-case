//
//  ProfileView.Model.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 12/09/24.
//

import Foundation

extension ProfileView {
  @MainActor final class Model: ObservableObject {
    @Published var user: User
    @Published var isLoading = false
    @Published var showError = false

    init(user: User) {
      self.user = user
    }

    func loadAboutMe() async {
      isLoading = true
      defer { isLoading = false }
      let url = URL.apiRequestURL(
        path: "/users/\(user.id)",
        parameters: ["filter": "!0Z-PEqoVRJE6GxDr1Gdbi.GPf"]
      )
      do {
        let (data, _) = try await URLSession.shared.data(from: url)
        let wrapper = try JSONDecoder.apiDecoder.decode(Wrapper<User>.self, from: data)
        user.aboutMe = wrapper.items[0].aboutMe
      } catch {
        showError = true
      }
    }
  }
}
