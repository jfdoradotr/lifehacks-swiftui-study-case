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
    Text(question.title)
      .font(.headline)
  }
}

#Preview {
  QuestionView(question: .preview)
}
