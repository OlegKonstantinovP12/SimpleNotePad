//
//
//  Created by Oleg Konstantinov.
//

import Foundation
import CoreData

class PersistentContainer {
    static let shared = PersistentContainer()
    private init() { }
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DB")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
}
