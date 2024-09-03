//
//  EditProfileView.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 03/09/24.
//

import SwiftUI

struct EditProfileView: View {
  @State var user: User

  var body: some View {
    VStack {
      Header(name: $user.name, profileImageURL: user.profileImageURL)
      AboutMe(
        text: Binding(
          get: { user.aboutMe ?? "" },
          set: { user.aboutMe = $0 }
        )
      )
    }
    .padding(20)
    .animation(.default, value: user)
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

// MARK: - Header

private extension EditProfileView {
  struct Header: View {
    @Binding var name: String
    var profileImageURL: URL?

    var body: some View {
      HStack(alignment: .top) {
        AsyncImage(url: profileImageURL) { image in
          image
            .circular(borderColor: .gray)
        } placeholder: {
          ProgressView()
        }
        .frame(width: 62.0, height: 62.0)
        VStack(alignment: .leading) {
          TextField("Name", text: $name)
          Divider()
          EditProfileView.ErrorMessage("The name cannot be empty")
            .visible(name.isEmpty)
        }
        .padding(.leading, 16.0)
      }
    }
  }
}

// MARK: - Previews

#Preview {
  EditProfileView(user: .preview)
}

#Preview("Interactive views") {
  struct PreviewContainer: View {
    @State private var name: String = User.preview.name
    @State private var aboutMe: String = User.preview.aboutMe!

    var body: some View {
      VStack {
        EditProfileView.Header(
          name: $name,
          profileImageURL: User.preview.profileImageURL
        )
        EditProfileView.AboutMe(text: $aboutMe)
      }
    }
  }

  return PreviewContainer()
}
