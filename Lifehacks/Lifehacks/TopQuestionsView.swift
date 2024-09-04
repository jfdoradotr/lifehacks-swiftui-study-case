//
//  TopQuestionsView.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 03/09/24.
//

import SwiftUI

struct TopQuestionsView: View {
  var body: some View {
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
  }
}

// MARK: - Row

private extension TopQuestionsView {
  struct Row: View {
    var body: some View {
      Text("Hello, World!")
    }
  }
}

// MARK: - Counter

private extension TopQuestionsView.Row {
  struct Counter: View {
    let count: Int
    let label: String

    var body: some View {
      VStack {
        Text("\(count)")
          .font(.title3)
          .bold()
        Text(label)
          .font(.caption)
      }
      .frame(width: 67, height: 67)
    }
  }
}

// MARK: - Previews

#Preview {
  TopQuestionsView()
}
