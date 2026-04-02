//
//
//  Created by Oleg Konstantinov.
//

import Foundation

final class WriteNoteRepositoryImpl: WriteNoteRepository {
    private let dataSource: WriteNoteDataSource
    init(dataSource: WriteNoteDataSource) {
        self.dataSource = dataSource
    }
    
    func writeNote(note: NoteItem) async throws {
        try await dataSource.writeNote(note: note)
    }
}
