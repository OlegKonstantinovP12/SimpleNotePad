//
//
//  Created by Oleg Konstantinov.
//

import Foundation

final class UpdateNoteRepositoryImpl: UpdateNoteRepository {
    private let dataSource: UpdateNoteDataSource
    init(dataSource: UpdateNoteDataSource) {
        self.dataSource = dataSource
    }
    
    func updateNote(note: NoteItem) async throws {
       try await dataSource.updateNote(note: note)
    }
    
    
}
