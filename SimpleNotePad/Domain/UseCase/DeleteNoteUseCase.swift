//
//
//  Created by Oleg Konstantinov.
//

import Foundation


protocol DeleteNoteUseCase: AnyObject {
    func execute(id: String) async throws
}

final class DeleteNoteUseCaseImpl: DeleteNoteUseCase {
    private let repository: DeleteNoteRepository
    init(repository: DeleteNoteRepository) {
        self.repository = repository
    }
    
    func execute(id: String) async throws {
        try await repository.deleteNote(id: id)
    }
}
