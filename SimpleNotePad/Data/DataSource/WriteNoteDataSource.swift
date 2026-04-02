//
//
//  Created by Oleg Konstantinov.
//

import Foundation

protocol WriteNoteDataSource: AnyObject {
    func writeNote(note: NoteItem) async throws
}
