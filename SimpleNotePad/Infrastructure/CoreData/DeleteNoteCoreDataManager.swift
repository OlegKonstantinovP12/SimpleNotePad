//
//
//  Created by Oleg Konstantinov.
//

import Foundation
import CoreData

final class DeleteNoteCoreDataManager: DeleteNoteDataSource {
    private let context = PersistentContainer.shared.persistentContainer.viewContext
    func deleteNote(id: String) async throws {
        let request = NoteEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id)
        guard let note = try? context.fetch(request).first else { return }
        context.delete(note)
        
        try? context.save()
    }
}
