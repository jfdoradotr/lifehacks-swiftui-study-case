//
//  TopQuestionsView.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 03/09/24.
//

import SwiftUI

struct TopQuestionsView: View {
  @EnvironmentObject private var questionsController: QuestionsController
  @StateObject private var model = Model()

  var body: some View {
    Content(questions: $questionsController.questions)
      .navigationChrome()
      .navigationDestination(for: Question.self) { question in
        QuestionView(question: question)
      }
      .task {
        guard questionsController.questions.isEmpty else { return }
        await model.fetchTopQuestions()
      }
      .refreshable {
        await model.fetchTopQuestions()
      }
      .onChange(of: model.fetchedQuestions, { oldValue, newValue in
        guard oldValue != newValue, !newValue.isEmpty else { return }
        questionsController.questions = newValue
      })
  }
}

// MARK: - Content

private extension TopQuestionsView {
  struct Content: View {
    @Binding var questions: [Question]

    var body: some View {
      List {
        ForEach(questions) { question in
          NavigationLink(value: question) {
            Row(question: question)
          }
        }
        .onDelete(perform: deleteItems(atOffsets:))
        .onMove(perform: move(fromOffsets:toOffset:))
      }
      .listStyle(.plain)
    }

    private func deleteItems(atOffsets offsets: IndexSet) {
      questions.remove(atOffsets: offsets)
    }

    private func move(fromOffsets source: IndexSet, toOffset destination: Int) {
      questions.move(fromOffsets: source, toOffset: destination)
    }
  }
}

private extension TopQuestionsView.Content {
  func navigationChrome() -> some View {
    self
      .navigationTitle("Top Questions")
      .toolbar {
        ToolbarItem(placement: .primaryAction) {
          EditButton()
        }
      }
  }
}

// MARK: - Row

private extension TopQuestionsView.Content {
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
            .styled()
          Counter(count: answerCount, label: "answers")
            .styled(isFilled: isAnswered)
            .role(.secondary)
          Details(viewCount: viewCount, date: date, name: name)
        }
        .padding(.vertical, 8)
      }
    }
  }
}

private extension TopQuestionsView.Content.Row {
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

private extension TopQuestionsView.Content.Row {
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

private extension TopQuestionsView.Content.Row {
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
  NavigationStack {
    TopQuestionsView.Content(questions: .constant(.preview))
      .navigationChrome()
  }
}

#Preview("Rows") {
  VStack(alignment: .leading) {
    TopQuestionsView.Content.Row(question: .preview)
    TopQuestionsView.Content.Row(question: .unanswered)
  }
}
