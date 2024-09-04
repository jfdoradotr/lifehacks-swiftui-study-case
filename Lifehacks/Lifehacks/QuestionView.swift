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
    VStack(alignment: .leading, spacing: 24.0) {
      HStack(alignment: .top, spacing: 16.0) {
        Voting(
          score: question.score,
          vote: .init(vote: question.vote),
          upvote: { question.upvote() },
          downvote: { question.downvote() },
          unvote: { question.unvote() }
        )
        Info(question: question)
      }
      QuestionBody(text: question.body)
      if let owner = question.owner {
        Owner(user: owner)
          .frame(maxWidth: .infinity, alignment: .trailing)
      }
    }
    .padding(.horizontal, 20.0)
  }
}

// MARK: - Info

private extension QuestionView {
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

private extension QuestionView.Info {
  init(question: Question) {
    title = question.title
    viewCount = question.viewCount
    date = question.creationDate
  }
}

// MARK: - Voting

private extension QuestionView {
  struct Voting: View {
    let score: Int
    let vote: Vote?
    let upvote: () -> Void
    let downvote: () -> Void
    let unvote: () -> Void

    enum Vote {
      case up, down
    }

    var body: some View {
      VStack(spacing: 8.0) {
        VoteButton(
          buttonType: .up,
          highlighted: vote == .up,
          action: { cast(vote: .up) }
        )
        Text("\(score)")
          .font(.title)
          .foregroundStyle(.secondary)
        VoteButton(
          buttonType: .down,
          highlighted: vote == .down,
          action: { cast(vote: .down) }
        )
      }
    }

    private func cast(vote: Vote) {
      switch (self.vote, vote) {
      case (nil, .up), (.down, .up): upvote()
      case (nil, .down), (.up, .down): downvote()
      default: unvote()
      }
    }
  }
}

private extension QuestionView.Voting.Vote {
  init?(vote: Question.Vote?) {
    switch vote {
    case .up: self = .up
    case .down: self = .down
    case .none: return nil
    }
  }
}

// MARK: - VoteButton

private extension QuestionView.Voting {
  struct VoteButton: View {
    let buttonType: ButtonType
    let highlighted: Bool
    let action: () -> Void

    var body: some View {
      Button(action: action, label: {
        buttonType.image(highlighted: highlighted)
          .resizable()
          .frame(width: 32, height: 32)
      })
    }
  }
}

private extension QuestionView.Voting.VoteButton {
  enum ButtonType: String {
    case up = "arrowtriangle.up"
    case down = "arrowtriangle.down"

    func image(highlighted: Bool) -> Image {
      let imageName = rawValue + (highlighted ? ".fill" : "")
      return Image(systemName: imageName)
    }
  }
}

// MARK: - QuestionBody

private extension QuestionView {
  struct QuestionBody: View {
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

#Preview {
  QuestionView(question: .preview)
}

#Preview("Vote Button", traits: .sizeThatFitsLayout) {
  HStack(spacing: 16) {
    QuestionView.Voting.VoteButton(buttonType: .up, highlighted: true, action: {})
    QuestionView.Voting.VoteButton(buttonType: .up, highlighted: false, action: {})
    QuestionView.Voting.VoteButton(buttonType: .down, highlighted: true, action: {})
    QuestionView.Voting.VoteButton(buttonType: .down, highlighted: false, action: {})
  }
}

#Preview("Accessibility", traits: .fixedLayout(width: 320, height: 568)) {
  QuestionView(question: .preview)
    .preferredColorScheme(.dark)
    .dynamicTypeSize(.xxxLarge)
}
