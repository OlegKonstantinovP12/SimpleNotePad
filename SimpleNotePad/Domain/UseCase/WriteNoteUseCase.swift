//
//
//  Created by Oleg Konstantinov.
//

import Foundation

protocol WriteNoteUseCase: AnyObject {
    func execute(note: NoteItem) async throws
}

final class WriteNoteUseCaseImpl: WriteNoteUseCase {
    private let repository: WriteNoteRepository
    init(repository: WriteNoteRepository) {
        self.repository = repository
    }
    
    func execute(note: NoteItem) async throws {
        try await repository.writeNote(note: note)
    }
}
