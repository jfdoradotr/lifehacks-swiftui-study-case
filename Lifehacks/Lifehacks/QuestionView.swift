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
    VStack(alignment: .leading, spacing: 8.0) {
      Text(question.title)
        .font(.headline)
      Text("Asked on \(question.creationDate.formatted(date: .long, time: .omitted))")
      Text("Viewed \(question.viewCount.formatted()) times")
    }
  }
}

#Preview {
  QuestionView(question: .preview)
}
