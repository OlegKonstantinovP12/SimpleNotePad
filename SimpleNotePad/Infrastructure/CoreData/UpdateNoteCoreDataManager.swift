//
//
//  Created by Oleg Konstantinov.
//

import Foundation
import CoreData

final class UpdateNoteCoreDataManager: UpdateNoteDataSource {
    private let context = PersistentContainer.shared.persistentContainer.viewContext
    
    func updateNote(note: NoteItem) async throws {
        let request = NoteEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", note.id)
        guard let entity = try? context.fetch(request).first else { return }
        entity.title = note.title
        entity.content = note.content
        
        try? context.save()
    }
}
