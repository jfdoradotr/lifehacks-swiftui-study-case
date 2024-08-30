//
//  QuestionView.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 28/08/24.
//

import SwiftUI

struct QuestionView: View {
  let question: Question

  var body: some View {
    VStack {
      Text(question.title)
        .font(.headline)
      Text("Asked on Sep 15th, 2019")
      Text("Viewed 2.770 times")
    }
  }
}

#Preview {
  QuestionView(question: .preview)
}
