//
//  Question.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 27/08/24.
//

import Foundation

struct Question: Identifiable, Hashable, Votable {
  let isAnswered: Bool
  let id: Int
  let viewCount: Int
  let answerCount: Int
  let title: String
  let body: String
  let creationDate: Date
  let owner: User?
  var score: Int
  var vote: Vote?
  var answers: [Answer]
}

extension Question: Decodable {
  enum CodingKeys: String, CodingKey {
    case id = "question_id"
    case viewCount = "view_count"
    case answerCount = "answer_count"
    case isAnswered = "is_answered"
    case creationDate = "creation_date"
    case body = "body_markdown"
    case title, score, owner, answers
  }

  init(from decoder: any Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decode(Int.self, forKey: .id)
    score = try container.decode(Int.self, forKey: .score)
    viewCount = try container.decode(Int.self, forKey: .viewCount)
    answerCount = try container.decode(Int.self, forKey: .answerCount)
    title = try container.decode(String.self, forKey: .title)
    isAnswered = try container.decode(Bool.self, forKey: .isAnswered)
    creationDate = try container.decode(Date.self, forKey: .creationDate)
    body = try container.decode(String.self, forKey: .body)
    answers = try container.decode([Answer].self, forKey: .answers)
    do {
      owner = try container.decodeIfPresent(User.self, forKey: .owner)
    } catch User.DecodingError.userDoesNotExist {
      owner = nil
    }
  }
}
