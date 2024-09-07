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
    List {
      QuestionDetails(question: $question)
        .padding(.bottom)
      ForEach($question.answers) { $answer in
        AnswerDetails(answer: $answer)
          .padding(.vertical, 24)
          .id(answer.id)
      }
    }
    .listStyle(.plain)
    .buttonStyle(.borderless)
  }
}

// MARK: - MarkdownBody

extension QuestionView {
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

extension QuestionView {
  struct Owner: View {
    let name: String
    let reputation: Int
    let profileImageURL: URL?

    var body: some View {
      HStack {
        AsyncProfileImage(url: profileImageURL)
          .frame(width: 48, height: 48)
        VStack(alignment: .leading, spacing: 4.0) {
          Text(name)
            .font(.headline)
          Text("\(reputation.formatted()) reputation")
            .font(.caption)
        }
      }
      .padding(16)
    }
  }
}

extension QuestionView.Owner {
  init(user: User) {
    name = user.name
    reputation = user.reputation
    profileImageURL = user.profileImageURL
  }
}

// MARK: - Previews

#Preview {
  QuestionView(question: .preview)
}

#Preview("Accessibility", traits: .fixedLayout(width: 320, height: 568)) {
  QuestionView(question: .preview)
    .preferredColorScheme(.dark)
    .dynamicTypeSize(.xxxLarge)
}
