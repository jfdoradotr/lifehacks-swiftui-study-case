//
//  TopQuestionsView.Model.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 12/09/24.
//

import Foundation

extension TopQuestionsView {
  @MainActor final class Model: ObservableObject {
    @Published var fetchedQuestions: [Question] = []
    @Published var isLoading = false
    @Published var showError = false

    func fetchTopQuestions() async {
      isLoading = true
      defer { isLoading = false }
      let url = URL.apiRequestURL(
        path: "/questions",
        parameters: [
          "sort": "votes",
          "order": "desc",
          "pagesize": "10",
          "filter": "**k8ThRQPg_hBG)oELYUvGv"
        ]
      )
      do {
        let (data, _) = try await URLSession.shared.data(from: url)
        let wrapper = try JSONDecoder.apiDecoder.decode(Wrapper<Question>.self, from: data)
        fetchedQuestions = wrapper.items
      } catch {
        showError = true
      }
    }
  }
}
