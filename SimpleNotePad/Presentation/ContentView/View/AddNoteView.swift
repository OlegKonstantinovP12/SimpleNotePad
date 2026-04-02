//
//
//  Created by Oleg Konstantinov.
//

import SwiftUI

struct AddNoteView: View {
    @StateObject var viewModel = Assembly.createAddNoteViewModel()
    let mode: ModeType
    @Binding var path: NavigationPath
    init(mode: ModeType, path: Binding<NavigationPath>) {
        self.mode = mode
        self._path = path
    }
    var body: some View {
        VStack {
            Spacer()
            TextField("Заголовок", text: $viewModel.title)
                .padding(.horizontal, 10)
                .padding(.vertical, 4)
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(lineWidth: 1)
                        .foregroundStyle(.gray.opacity(0.3))
                }
            TextEditor(text: $viewModel.content)
                .frame(height: 200)
                .scrollContentBackground(.hidden)
                .background(.gray.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            Spacer()
            MainButton(title: "Save") {
                switch mode {
                case .create:
                    Task {
                        await viewModel.addNote()
                    }
                case .edit(let note):
                    Task {
                        await viewModel.updateNote(id: note.id)
                    }
                }

                keyboardHide()
            }
        }
        .padding(.horizontal, 20)
        .onAppear {
            switch mode {
            case .create:
                break
            case .edit(let note):
                    viewModel.title = note.title
                    viewModel.content = note.content
            }
        }
    }
}

extension AddNoteView {
    func keyboardHide() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    @Previewable @State var path = NavigationPath()
    AddNoteView(mode: .create, path: $path)
}
