//
//
//  Created by Oleg Konstantinov.
//

import Foundation

protocol FetchNoteUseCase: AnyObject {
    func execute() async throws -> [NoteItem]
}

final class FetchNoteUseCaseImpl: FetchNoteUseCase {
    private let repository: FetchNoteRepository
    init(repository: FetchNoteRepository) {
        self.repository = repository
    }
    
    func execute() async throws -> [NoteItem] {
        try await repository.fetchNotes()
    }
}
