//
//
//  Created by Oleg Konstantinov.
//

import Foundation
import CoreData

final class WriteNoteCoreDataManager: WriteNoteDataSource {
    private let context = PersistentContainer.shared.persistentContainer.viewContext
    
    func writeNote(note: NoteItem) async throws {
        let _ = NoteMapper.toEntity(from: note, context: context)
        
        try context.save()
    }
}
