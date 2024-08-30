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
    HStack(alignment: .top, spacing: 16.0) {
      VStack(spacing: 8.0) {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
          Image(systemName: "arrowtriangle.up.fill")
        })
        Text("\(question.score)")
          .font(.title)
          .foregroundStyle(.secondary)
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
          Image(systemName: "arrowtriangle.down.fill")
        })

      }
      VStack(alignment: .leading, spacing: 8.0) {
        Text(question.title)
          .font(.headline)
        Group {
          Text("Asked on \(question.creationDate.formatted(date: .long, time: .omitted))")
          Text("Viewed \(question.viewCount.formatted()) times")
        }
        .font(.caption)
        .foregroundStyle(.secondary)
      }
    }
  }
}

#Preview {
  QuestionView(question: .preview)
}
