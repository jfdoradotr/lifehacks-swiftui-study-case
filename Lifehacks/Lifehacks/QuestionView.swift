//
//  QuestionView.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 28/08/24.
//

import SwiftUI

struct QuestionView: View {
  @State var question: Question

  var body: some View {
    QuestionDetails(question: $question)
      .padding(.horizontal, 20.0)
  }
}

// MARK: - QuestionDetails

private extension QuestionView {
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

// MARK: - MarkdownBody

private extension QuestionView {
  struct MarkdownBody: View {
    let text: String

    var body: some View {
      let markdown = try! AttributedString(
        markdown: text,
        options: .init(interpretedSyntax: .inlineOnlyPreservingWhitespace)
      )
      Text(markdown)
        .font(.subheadline)
    }
  }
}

// MARK: - Owner

private extension QuestionView {
  struct Owner: View {
    let name: String
    let reputation: Int
    let profileImageURL: URL?

    var body: some View {
      HStack {
        AsyncImage(url: profileImageURL) { image in
          image
            .circular()
        } placeholder: {
          ProgressView()
        }
        .frame(width: 48, height: 48)
        VStack(alignment: .leading, spacing: 4.0) {
          Text(name)
            .font(.headline)
          Text("\(reputation.formatted()) reputation")
            .font(.caption)
        }
      }
      .padding(16)
      .style(color: .accentColor)
    }
  }
}

private extension QuestionView.Owner {
  init(user: User) {
    name = user.name
    reputation = user.reputation
    profileImageURL = user.profileImageURL
  }
}

// MARK: - Previews

#Preview("QuestionDetails") {
  QuestionView.QuestionDetails(question: .constant(.preview))
}

#Preview("Accessibility", traits: .fixedLayout(width: 320, height: 568)) {
  QuestionView(question: .preview)
    .preferredColorScheme(.dark)
    .dynamicTypeSize(.xxxLarge)
}
