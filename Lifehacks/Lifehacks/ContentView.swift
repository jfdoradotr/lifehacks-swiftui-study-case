//
//  ContentView.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 27/08/24.
//

import SwiftUI

struct ContentView: View {
  @State private var user: User = .preview

  var body: some View {
    TabView {
      TopQuestionsView(questions: .preview)
        .tabItem { Label("Top Questions", systemImage: "list.number") }
      ProfileView(user: .preview)
        .tabItem { Label("Profile", systemImage: "person.circle") }
      SettingsView()
        .tabItem { Label("Settings", systemImage: "gear") }
    }
  }
}

#Preview {
  ContentView()
}
