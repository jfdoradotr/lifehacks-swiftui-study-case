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
      Voting(score: question.score)
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

// MARK: - Voting

private extension QuestionView {
  struct Voting: View {
    let score: Int

    var body: some View {
      VStack(spacing: 8.0) {
        VoteButton(imageName: "arrowtriangle.up.fill")
        Text("\(score)")
          .font(.title)
          .foregroundStyle(.secondary)
        VoteButton(imageName: "arrowtriangle.down.fill")
      }

    }
  }
}

// MARK: - VoteButton

private extension QuestionView.Voting {
  struct VoteButton: View {
    let imageName: String

    var body: some View {
      Button(action: {}, label: {
        Image(systemName: imageName)
      })
    }
  }
}

// MARK: - Previews

#Preview {
  QuestionView(question: .preview)
}
