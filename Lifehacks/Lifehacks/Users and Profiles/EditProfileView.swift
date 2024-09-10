//
//  EditProfileView.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 03/09/24.
//

import PhotosUI
import SwiftUI

struct EditProfileView: View {
  @State var user: User
  let onEditingFinished: () -> Void

  @State private var name: String
  @State private var aboutMe: String?
  @State private var photosItem: PhotosPickerItem?

  init(user: User, onEditingFinished: @escaping () -> Void) {
    self.user = user
    self.onEditingFinished = onEditingFinished
    self._name = .init(initialValue: user.name)
    self._aboutMe = .init(initialValue: user.aboutMe ?? "")
  }

  var body: some View {
    ScrollView {
      Header(
        name: $user.name,
        photosItem: $photosItem,
        profileImageURL: user.profileImageURL
      )
      AboutMe(
        text: Binding(
          get: { aboutMe ?? "" },
          set: { aboutMe = $0 }
        )
      )
    }
    .padding(20)
    .animation(.default, value: user)
    .navigationTitle("Edit Profile")
    .toolbar {
      ToolbarItem(placement: .cancellationAction) {
        Button("Cancel", action: onEditingFinished)
      }
      ToolbarItem(placement: .confirmationAction) {
        Button("Save", action: onEditingFinished)
      }
    }
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
    @Binding var photosItem: PhotosPickerItem?
    var profileImageURL: URL?

    var body: some View {
      HStack(alignment: .top) {
        AsyncProfileImage(url: profileImageURL, borderColor: .gray)
          .frame(width: 62.0, height: 62.0)
          .overlay {
            PhotosPicker("Edit", selection: $photosItem)
              .bold()
              .foregroundStyle(.white)
          }
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
  NavigationStack {
    EditProfileView(user: .preview) {}
  }
}

#Preview("Interactive views") {
  struct PreviewContainer: View {
    @State private var name: String = User.preview.name
    @State private var aboutMe: String = User.preview.aboutMe!

    var body: some View {
      VStack {
        EditProfileView.Header(
          name: $name,
          photosItem: .constant(nil),
          profileImageURL: User.preview.profileImageURL
        )
        EditProfileView.AboutMe(text: $aboutMe)
      }
    }
  }

  return PreviewContainer()
}
