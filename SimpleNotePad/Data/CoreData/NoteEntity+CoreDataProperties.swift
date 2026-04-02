//
//
//  Created by Oleg Konstantinov.
//
//

public import Foundation
public import CoreData


public typealias NoteEntityCoreDataPropertiesSet = NSSet

extension NoteEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NoteEntity> {
        return NSFetchRequest<NoteEntity>(entityName: "NoteEntity")
    }

    @NSManaged public var id: String?
    @NSManaged public var title: String?
    @NSManaged public var content: String?

}

extension NoteEntity : Identifiable {

}
