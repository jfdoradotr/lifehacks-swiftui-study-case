//
//  SettingsView.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 03/09/24.
//

import SwiftUI

struct SettingsView: View {
  var body: some View {
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
  }
}

// MARK: - Row

private extension SettingsView {
  struct Row: View {
    let theme: Theme

    var body: some View {
      LabeledContent {
        Placeholder(imageName: "sun.max.fill")
          .style(color: theme.accentColor)
        Placeholder(imageName: "moon.fill")
          .style(color: theme.secondaryColor)
        Placeholder(imageName: "leaf")
          .style(color: theme.secondaryColor, isFilled: false)
      } label: {
        Text(theme.name)
      }
    }
  }
}

// MARK: - Placeholder

private extension SettingsView.Row {
  struct Placeholder: View {
    let imageName: String

    var body: some View {
      Image(systemName: imageName)
        .frame(width: 42.0, height: 42.0)
    }
  }
}

// MARK: - Previews

#Preview {
  SettingsView()
}
