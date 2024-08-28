//
//  PreviewData.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 28/08/24.
//

import Foundation

// MARK: - User

extension User {
  static var preview: User {
    Question.preview.owner!
  }
}

// MARK: - Question

extension Question {
  static var preview: Question {
    [Question].preview[0]
  }
}

// MARK: - [Question]

extension [Question] {
  static var preview: [Question] {
    let url = Bundle.main.url(forResource: "Questions", withExtension: "json")!
    let data = try! Data(contentsOf: url)
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .secondsSince1970
    let wrapper = try! decoder.decode(Wrapper<Question>.self, from: data)
    return wrapper.items
  }
}
