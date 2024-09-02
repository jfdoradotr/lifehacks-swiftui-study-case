//
//  Image+Circular.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 02/09/24.
//

import SwiftUI

extension Image {
  func circular(borderColor: Color = .white) -> some View {
    self
      .resizable()
      .clipShape(Circle())
      .overlay(
        Circle()
          .stroke(borderColor, lineWidth: 2)
      )
  }
}

// MARK: - Previews

#Preview(traits: .sizeThatFitsLayout) {
  Image("Avatar")
    .circular(borderColor: .accentColor)
    .frame(width: 200, height: 200)
}
