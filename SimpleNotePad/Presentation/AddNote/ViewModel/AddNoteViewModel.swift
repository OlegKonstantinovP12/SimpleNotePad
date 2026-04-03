//
//
//  Created by Oleg Konstantinov.
//

import Foundation
import Combine

@MainActor
final class AddNoteViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var content: String = ""
    
    private let writeNoteUseCase: WriteNoteUseCase
    private let updateUseCase: UpdateNoteUseCase
    init(writeNoteUseCase: WriteNoteUseCase, updateUseCase: UpdateNoteUseCase) {
        self.writeNoteUseCase = writeNoteUseCase
        self.updateUseCase = updateUseCase
    }
    
    func updateNote(id: String) async {
        do {
            try await updateUseCase.execute(note: NoteItem(id: id, title: title, content: content))
        } catch {
            print(error)
        }
    }
    
    func addNote() async {
        if !self.title.isEmpty || !self.content.isEmpty {
            do {
                try await self.writeNoteUseCase.execute(
                    note: NoteItem(
                        id: UUID().uuidString,
                        title: title,
                        content: content
                    )
                )
            } catch {
                print(error)
            }
        }
    }
}
