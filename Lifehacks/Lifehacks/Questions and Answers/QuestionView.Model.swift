//
//  QuestionView.Model.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 12/09/24.
//

import Foundation

extension QuestionView {
  @MainActor final class Model: ObservableObject {
    @Published var question: Question
    @Published var isLoading = false
    @Published var showError = false

    init(question: Question) {
      self.question = question
    }

    func loadDetails() async {
      isLoading = true
      defer { isLoading = false }
      let url = URL.apiRequestURL(
        path: "/questions/\(question.id)",
        parameters: ["filter": "-T2M9.3eG9hXfgHaShP_t9UiIkcZIWFCzoC_"]
      )
      do {
        let (data, _) = try await URLSession.shared.data(from: url)
        let wrapper = try JSONDecoder.apiDecoder.decode(Wrapper<Question>.self, from: data)
        question = wrapper.items[0]
      } catch {
        showError = true
      }
    }
  }
}
