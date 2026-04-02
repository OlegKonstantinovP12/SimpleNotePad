//
//
//  Created by Oleg Konstantinov.
//

import Foundation

protocol UpdateNoteRepository: AnyObject {
    func updateNote(note: NoteItem) async throws
}
