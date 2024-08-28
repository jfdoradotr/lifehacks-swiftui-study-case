//
//  Question.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 27/08/24.
//

import Foundation

struct Question {
  let isAnswered: Bool
  let id: Int
  let score: Int
  let viewCount: Int
  let answerCount: Int
  let title: String
  let body: String
  let creationDate: Date
  let owner: User?
}

extension Question {
  enum Vote: Int {
    case up = 1
    case down = -1
  }
}
