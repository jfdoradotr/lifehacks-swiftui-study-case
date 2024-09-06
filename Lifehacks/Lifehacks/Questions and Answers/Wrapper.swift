//
//  Wrapper.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 27/08/24.
//

import Foundation

struct Wrapper<ModelType: Decodable>: Decodable {
  let items: [ModelType]
}
