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
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize

    var body: some View {
      VStack(alignment: .leading, spacing: 24.0) {
        if dynamicTypeSize.isAccessibilitySize {
          VStack(alignment: .leading) {
            header
          }
        } else {
          HStack(alignment: .top, spacing: 16.0) {
            header
          }
        }
        QuestionView.MarkdownBody(text: question.body)
        QuestionView.OwnerLink(user: question.owner)
      }
    }
  }
}

private extension QuestionView.QuestionDetails {
  var header: some View {
    Group {
      QuestionView.Voting(
        score: question.score,
        vote: .init(vote: question.vote),
        upvote: { question.upvote() },
        downvote: { question.downvote() },
        unvote: { question.unvote() }
      )
      Info(question: question)
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

#Preview("Accessibility", traits: .fixedLayout(width: 320, height: 568)) {
  QuestionView.QuestionDetails(question: .constant(.preview))
    .preferredColorScheme(.dark)
    .dynamicTypeSize(.accessibility4)
}
