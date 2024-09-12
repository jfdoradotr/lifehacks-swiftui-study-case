//
//  View+Style.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 02/09/24.
//

import SwiftUI

struct Style: ViewModifier {
  let color: Color?
  var isFilled = true
  var isRounded = true

  @Environment(\.theme) private var theme: Theme
  @Environment(\.role) private var role: Role

  var appliedColor: Color {
    if let color {
      return color
    }

    return role == .primary ? theme.accentColor : theme.secondaryColor
  }

  func body(content: Content) -> some View {
    let radius = isRounded ? 10.0 : 0.0
    if isFilled {
      content
        .background(appliedColor)
        .clipShape(RoundedRectangle(cornerRadius: radius))
        .foregroundStyle(.white)
    } else {
      content
        .background(
          RoundedRectangle(cornerRadius: radius)
            .strokeBorder(appliedColor, lineWidth: 2.0)
        )
    }
  }
}

// MARK: - Style+Role

extension Style {
  enum Role {
    case primary, secondary
  }

  struct RoleKey: EnvironmentKey {
    static let defaultValue = Role.primary
  }
}

extension EnvironmentValues {
  var role: Style.Role {
    get { self[Style.RoleKey.self] }
    set { self[Style.RoleKey  .self] = newValue }
  }
}

extension View {
  func role(_ role: Style.Role) -> some View {
    environment(\.role, role)
  }
}

// MARK: - View+Style

extension View {
  @available(*, deprecated, renamed: "styled", message: "Use the 'styled' method instead, which provides better default values and improved functionality.")
  func style(color: Color, isFilled: Bool = true, isRounded: Bool = true) -> some View {
    modifier(Style(color: color, isFilled: isFilled, isRounded: isRounded))
  }

  func styled(color: Color? = nil, isFilled: Bool = true, isRounded: Bool = true) -> some View {
    modifier(Style(color: color, isFilled: isFilled, isRounded: isRounded))
  }
}

// MARK: - Previews

#Preview {
  let size = 100.0

  return Grid {
    GridRow {
      Text("Accent")
        .frame(width: size, height: size)
        .styled(color: .accentColor, isRounded: false)
      Text("Pizazz")
        .frame(width: size, height: size)
        .styled(color: .pizazz)
      Text("Pizazz")
        .frame(width: size, height: size)
        .styled(color: .pizazz, isFilled: false)
    }
    GridRow {
      Text("Electric Violet")
        .frame(width: size, height: size)
        .styled(color: .electricViolet, isRounded: false)
      Text("Blaze Orange")
        .frame(width: size, height: size)
        .styled(color: .blazeOrange)
      Text("Pizazz")
        .frame(width: size, height: size)
        .styled(color: .blazeOrange, isFilled: false)
    }
  }
}
