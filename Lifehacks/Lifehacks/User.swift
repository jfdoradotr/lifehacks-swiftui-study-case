//
//  User.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 27/08/24.
//

import Foundation

struct User {
  let id: Int
  let reputation: Int
  let name: String
  let aboutMe: String?
  let profileImageURL: URL?
}

extension User: Decodable {
  enum CodingKeys: String, CodingKey {
    case id = "user_id"
    case name = "display_name"
    case aboutMe = "about_me"
    case profileImageURL = "profile_image"
    case reputation
  }
}
