//
//  SettingsView.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 03/09/24.
//

import SwiftUI

struct SettingsView: View {
  @EnvironmentObject private var settingsController: SettingsController

  var body: some View {
    List(selection: $settingsController.selectedThemeID) {
      Section(header: Text("APP THEME")) {
        ForEach(Theme.allThemes) { theme in
          Row(theme: theme, isSelected: theme.id == settingsController.selectedThemeID)
            .listRowInsets(
              .init(
                top: 16.0,
                leading: 16.0,
                bottom: 16.0,
                trailing: 16.0
              )
            )
            .listRowBackground(Color(uiColor: .systemBackground))
        }
      }
    }
    .navigationTitle(Text("Settings"))
  }
}

// MARK: - Row

private extension SettingsView {
  struct Row: View {
    let theme: Theme
    let isSelected: Bool

    var body: some View {
      LabeledContent {
        Placeholder(imageName: "sun.max.fill")
          .styled(color: theme.accentColor)
        Placeholder(imageName: "moon.fill")
          .styled(color: theme.secondaryColor)
        Placeholder(imageName: "leaf")
          .styled(color: theme.secondaryColor, isFilled: false)
      } label: {
        HStack {
          Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
            .font(.title)
            .foregroundStyle(isSelected ? theme.accentColor : .secondary)
          Text(theme.name)
        }
      }
      .font(.headline)
      .foregroundStyle(.primary)
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
  NavigationStack {
    SettingsView()
  }
  .environmentObject(SettingsController())
}
