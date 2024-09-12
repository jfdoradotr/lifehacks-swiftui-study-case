//
//  SettingsController.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 12/09/24.
//

import Foundation

final class SettingsController: ObservableObject {
  @Published var selectedThemeID: String? = Theme.default.id
}
