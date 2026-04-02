//
//
//  Created by Oleg Konstantinov.
//

import Foundation

final class FetchNoteRepositoryImpl: FetchNoteRepository {
    private let dataSource: FetchNoteDataSource
    init(dataSource: FetchNoteDataSource) {
        self.dataSource = dataSource
    }
    
    func fetchNotes() async throws -> [NoteItem] {
        try await dataSource.fetchNotes()
    }
}
