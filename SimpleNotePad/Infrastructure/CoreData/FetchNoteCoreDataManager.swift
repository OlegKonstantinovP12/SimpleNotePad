//
//
//  Created by Oleg Konstantinov.
//

import Foundation
import CoreData

final class FetchNoteCoreDataManager: FetchNoteDataSource {
    private let context = PersistentContainer.shared.persistentContainer.viewContext
    func fetchNotes() async throws -> [NoteItem] {
        let request = NoteEntity.fetchRequest()
        let notesEntities = try context.fetch(request)
        
        let notesItems = notesEntities.map {
            NoteMapper.toDomain(from: $0)
        }
        return notesItems
    }
}
