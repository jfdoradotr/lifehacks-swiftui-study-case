//
//  LifehacksApp.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 27/08/24.
//

import SwiftUI

@main
struct LifehacksApp: App {
  @State private var theme: Theme = .vibrant

  var body: some Scene {
    WindowGroup {
      ContentView()
        .theme(theme)
        .tint(theme.accentColor)
    }
  }
}
