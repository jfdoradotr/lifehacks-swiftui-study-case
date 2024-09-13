//
//  EditProfileView.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 03/09/24.
//

import PhotosUI
import SwiftUI

struct EditProfileView: View {
  let onEditingFinished: () -> Void
  @StateObject private var model: Model

  @State private var isDiscarding: Bool = false

  init(user: User, onEditingFinished: @escaping () -> Void) {
    self.onEditingFinished = onEditingFinished
    self._model = .init(wrappedValue: Model(user: user))
  }

  var body: some View {
    ScrollView {
      Header(
        name: $model.name,
        photosItem: $model.photosItem,
        profileImageURL: nil
      )
      .animation(.default, value: model.name)
      AboutMe(text: $model.aboutMe)
        .animation(.default, value: model.aboutMe)
    }
    .padding(20)
    .navigationTitle("Edit Profile")
    .toolbar {
      cancelButton
      saveButton
    }
    .alert("Do you want to discard your edits?", isPresented: $isDiscarding) {
      Button("Discard Changes", role: .destructive, action: onEditingFinished)
      Button("Continue editing", role: .cancel, action: {})
    }
  }
}

private extension EditProfileView {
  var cancelButton: some ToolbarContent {
    ToolbarItem(placement: .cancellationAction) {
      Button("Cancel") {
        if model.isContentEdited {
          isDiscarding = true
        } else {
          onEditingFinished()
        }
      }
    }
  }

  var saveButton: some ToolbarContent {
    ToolbarItem(placement: .confirmationAction) {
      Button("Save", action: onEditingFinished)
    }
  }
}

// MARK: - ErrorMessage

private extension EditProfileView {
  struct ErrorMessage: View {
    let text: String

    @Environment(\.theme) private var theme: Theme

    init(_ text: String) {
      self.text = text
    }

    var body: some View {
      Text(text)
        .font(.footnote)
        .bold()
        .foregroundStyle(theme.secondaryColor)
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
