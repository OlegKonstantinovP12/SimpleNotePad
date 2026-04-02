//
//
//  Created by Oleg Konstantinov.
//

import Foundation

protocol UpdateNoteUseCase: AnyObject {
    func execute(note: NoteItem) async throws
}

final class UpdateNoteUseCaseImpl: UpdateNoteUseCase {
    private let repository: UpdateNoteRepository
    init(repository: UpdateNoteRepository) {
        self.repository = repository
    }
    func execute(note: NoteItem) async throws {
       try await repository.updateNote(note: note)
    }
}
