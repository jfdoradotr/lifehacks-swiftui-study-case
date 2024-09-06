//
//  QuestionView.QuestionDetails.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 06/09/24.
//

import SwiftUI

extension QuestionView {
  struct QuestionDetails: View {
    @Binding var question: Question

    var body: some View {
      VStack(alignment: .leading, spacing: 24.0) {
        HStack(alignment: .top, spacing: 16.0) {
          QuestionView.Voting(
            score: question.score,
            vote: .init(vote: question.vote),
            upvote: { question.upvote() },
            downvote: { question.downvote() },
            unvote: { question.unvote() }
          )
          Info(question: question)
        }
        QuestionView.MarkdownBody(text: question.body)
        if let owner = question.owner {
          QuestionView.Owner(user: owner)
            .style(color: .accentColor)
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
      }
    }
  }
}

// MARK: - Info

private extension QuestionView.QuestionDetails {
  struct Info: View {
    let title: String
    let viewCount: Int
    let date: Date

    var body: some View {
      VStack(alignment: .leading, spacing: 8.0) {
        Text(title)
          .font(.headline)
        Group {
          Text(date: date)
          Text(viewCount: viewCount)
        }
        .font(.caption)
        .foregroundStyle(.secondary)
      }
    }
  }
}

private extension QuestionView.QuestionDetails.Info {
  init(question: Question) {
    title = question.title
    viewCount = question.viewCount
    date = question.creationDate
  }
}

// MARK: - Previews

#Preview("QuestionDetails") {
  QuestionView.QuestionDetails(question: .constant(.preview))
}
