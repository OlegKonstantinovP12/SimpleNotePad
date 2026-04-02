//
//
//  Created by Oleg Konstantinov.
//

import SwiftUI

struct ListNotes: View {
    @StateObject var viewModel = Assembly.createListNotesViewModel()
    @State var path = NavigationPath()
    @EnvironmentObject var appViewModel: AppViewModel
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text("Заметки")
                        .font(.system(.largeTitle, weight: .bold))
                    Spacer()
                    Button {
                        path.append(ModeType.create)
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.white)
                        
                    }
                    .frame(width: 40, height: 40)
                    .background(.blue)
                    .clipShape(Circle())
                    
                }
                List {
                    ForEach(viewModel.notes) { note in
                        Button {
                            path.append(ModeType.edit(note))
                        } label: {
                            TableButton(note: note)
                        }
                        
                        
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            let id = viewModel.notes[index].id
                            Task {
                                await viewModel.deleteNote(id: id)
                            }
                        }
                    }
                }
                .listStyle(.plain)
                Spacer()
                VStack {
                    Button {
                        viewModel.signOut()
                        appViewModel.currentPage = .login
                    } label: {
                        Text("Выйти")
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
            .onAppear {
                Task {
                    await viewModel.getNotes()
                }
            }
            .navigationDestination(for: ModeType.self) { mode in
                AddNoteView(mode: mode, path: $path)
            }
        }
    }
}
#Preview {
    ListNotes()
}
