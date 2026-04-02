//
//
//  Created by Oleg Konstantinov.
//

import Foundation

protocol WriteNoteRepository: AnyObject {
    func writeNote(note: NoteItem) async throws
}
