//
//  View+Visible.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 03/09/24.
//

import SwiftUI

extension View {
  func visible(_ isVisible: Bool) -> some View {
    opacity(isVisible ? 1.0 : 0.0)
  }
}
