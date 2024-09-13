//
//  URL+Generator.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 12/09/24.
//

import Foundation

extension URL {
  func appendingParameters(_ parameters: [String: String]) -> URL {
    var queryItems: [URLQueryItem] = []
    for (key, value) in parameters {
      queryItems.append(URLQueryItem(name: key, value: value))
    }
    return appending(queryItems: queryItems)
  }

  static func apiRequestURL(path: String, parameters: [String: String]) -> URL {
    URL(string: "https://api.stackexchange.com/2.3")!
      .appending(path: path)
      .appendingParameters(["site": "lifehacks"])
      .appendingParameters(parameters)
  }
}
