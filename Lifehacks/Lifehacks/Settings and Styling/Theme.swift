//
//  Theme.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 03/09/24.
//

import SwiftUI

// MARK: - ThemeKey

struct ThemeKey: EnvironmentKey {
  static let defaultValue = Theme.default
}

extension EnvironmentValues {
  var theme: Theme {
    get { self[ThemeKey.self] }
    set { self[ThemeKey.self] = newValue }
  }
}

extension View {
  func theme(_ theme: Theme) -> some View {
    environment(\.theme, theme)
  }
}

// MARK: - Theme

struct Theme: Identifiable, Hashable {
  let name: String
  let accentColor: Color
  let secondaryColor: Color

  var id: String { name }

  static let `default` = Theme(
    name: "Default",
    accentColor: .cornflowerBlue,
    secondaryColor: .pizazz
  )

  static let vibrant = Theme(
    name: "Vibrant",
    accentColor: .electricViolet,
    secondaryColor: .blazeOrange
  )

  static let allThemes: [Theme] = [.default, .vibrant]
}
