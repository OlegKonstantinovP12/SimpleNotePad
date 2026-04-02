//
//
//  Created by Oleg Konstantinov.
//

import Foundation

protocol FetchNoteRepository: AnyObject {
    func fetchNotes() async throws -> [NoteItem]
}
