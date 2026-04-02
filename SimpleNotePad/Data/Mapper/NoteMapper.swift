//
//
//  Created by Oleg Konstantinov.
//

import Foundation
import CoreData

final class NoteMapper {
    static func toDomain(from: NoteEntity) -> NoteItem  {
        let item = NoteItem(
            id: from.id!,
            title: from.title ?? "",
            content: from.content ?? ""
        )
        return item
    }
    
    static func toEntity(from: NoteItem, context: NSManagedObjectContext) -> NoteEntity {
        let entity = NoteEntity(context: context)
        entity.id = from.id
        entity.title = from.title
        entity.content = from.content
        
        return entity
    }
}
