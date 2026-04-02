//
//
//  Created by Oleg Konstantinov.
//

import Foundation

final class DeleteNoteRepositoryImpl: DeleteNoteRepository {
    
    private let dataSource: DeleteNoteDataSource
    init(dataSource: DeleteNoteDataSource) {
        self.dataSource = dataSource
    }
    
    func deleteNote(id: String) async throws {
        try await dataSource.deleteNote(id: id)
    }
    
}
