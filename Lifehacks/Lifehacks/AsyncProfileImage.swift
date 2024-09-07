//
//  AsyncProfileImage.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 06/09/24.
//

import SwiftUI

struct AsyncProfileImage: View {
  let url: URL?
  var borderColor: Color = .white

  var body: some View {
    AsyncImage(url: url) { image in
      image
        .circular(borderColor: borderColor)
    } placeholder: {
      ProgressView()
    }
  }
}

#Preview(traits: .sizeThatFitsLayout) {
  AsyncProfileImage(url: User.preview.profileImageURL)
}
