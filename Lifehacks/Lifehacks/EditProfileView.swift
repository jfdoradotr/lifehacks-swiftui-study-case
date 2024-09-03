//
//  EditProfileView.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 03/09/24.
//

import SwiftUI

struct EditProfileView: View {
  var body: some View {
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
  }
}

// MARK: - ErrorMessage

private extension EditProfileView {
  struct ErrorMessage: View {
    let text: String

    init(_ text: String) {
      self.text = text
    }

    var body: some View {
      Text(text)
        .font(.footnote)
        .bold()
        .foregroundStyle(.orange)
    }
  }
}

// MARK: - AboutMe

private extension EditProfileView {
  struct AboutMe: View {
    @Binding var text: String

    var body: some View {
      VStack(alignment: .leading) {
        Text("About me:")
          .font(.callout)
          .bold()
        TextEditor(text: $text)
          .frame(height: 200.0)
        EditProfileView.ErrorMessage("The about me cannot be empty")
          .visible(text.isEmpty)
      }
    }
  }
}

// MARK: - Previews

#Preview {
  EditProfileView()
}
