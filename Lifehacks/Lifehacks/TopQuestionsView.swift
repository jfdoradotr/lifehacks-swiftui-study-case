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
    let title: String
    let score: Int
    let answerCount: Int
    let viewCount: Int
    let date: Date
    let name: String
    let isAnswered: Bool

    var body: some View {
      VStack(alignment: .leading, spacing: 8) {
        Text(title)
          .font(.headline)
        HStack(alignment: .center, spacing: 16) {
          Counter(count: score, label: "votes")
            .style(color: .accentColor)
          Counter(count: answerCount, label: "answers")
            .style(color: .pizazz, isFilled: isAnswered)
          Details(viewCount: viewCount, date: date, name: name)
        }
        .padding(.vertical, 8)
      }
    }
  }
}

private extension TopQuestionsView.Row {
  init(question: Question) {
    self.init(
      title: question.title,
      score: question.score,
      answerCount: question.answerCount,
      viewCount: question.viewCount,
      date: question.creationDate,
      name: question.owner?.name ?? "",
      isAnswered: question.isAnswered
    )
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

// MARK: - Details

private extension TopQuestionsView.Row {
  struct Details: View {
    let viewCount: Int
    let date: Date
    let name: String

    var body: some View {
      VStack(alignment: .leading, spacing: 4.0) {
        Text(viewCount: viewCount)
        Text(date: date)
        Text(name)
      }
      .font(.caption)
      .foregroundStyle(.secondary)
    }
  }
}

// MARK: - Previews

#Preview {
  TopQuestionsView()
}
