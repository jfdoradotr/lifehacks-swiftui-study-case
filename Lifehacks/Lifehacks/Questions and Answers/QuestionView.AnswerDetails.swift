//
//  QuestionView.AnswerDetails.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 06/09/24.
//

import SwiftUI

extension QuestionView {
  struct AnswerDetails: View {
    @Binding var answer: Answer

    var body: some View {
      HStack(alignment: .top, spacing: 16) {
        VStack(spacing: 16.0) {
          QuestionView.Voting(
            score: answer.score,
            vote: .init(vote: answer.vote),
            upvote: { answer.upvote() },
            downvote: { answer.downvote() },
            unvote: { answer.unvote() }
          )
          if answer.isAccepted {
            Image(systemName: "checkmark.circle.fill")
              .font(.largeTitle)
              .foregroundStyle(.pizazz)
          }
        }
        VStack(alignment: .leading, spacing: 8) {
          QuestionView.MarkdownBody(text: answer.body)
          Text(date: answer.creationDate, prefix: "Answered on")
            .font(.caption)
            .foregroundStyle(.secondary)
          QuestionView.OwnerLink(user: answer.owner)
            .role(.secondary)
        }
      }
    }
  }
}

// MARK: - Previews

#Preview {
  QuestionView.AnswerDetails(answer: .constant(.preview))
    .padding(.horizontal, 20)
}
