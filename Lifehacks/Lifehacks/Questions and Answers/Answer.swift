//
//  Answer.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 04/09/24.
//

import Foundation

struct Answer: Identifiable, Hashable, Votable {
  let id: Int
  let body: String
  let creationDate: Date
  let isAccepted: Bool
  let owner: User?
  var score: Int
  var vote: Vote?
}

extension Answer: Decodable {
  enum CodingKeys: String, CodingKey {
    case id = "answer_id"
    case body = "body_markdown"
    case creationDate = "creation_date"
    case isAccepted = "is_accepted"
    case owner, score
  }

  init(from decoder: any Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decode(Int.self, forKey: .id)
    body = try container.decode(String.self, forKey: .body)
    creationDate = try container.decode(Date.self, forKey: .creationDate)
    isAccepted = try container.decode(Bool.self, forKey: .isAccepted)
    score = try container.decode(Int.self, forKey: .score)
    do {
      owner = try container.decodeIfPresent(User.self, forKey: .owner)
    } catch User.DecodingError.userDoesNotExist {
      owner = nil
    }
  }
}
