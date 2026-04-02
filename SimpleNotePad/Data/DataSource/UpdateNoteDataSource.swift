//
//
//  Created by Oleg Konstantinov.
//

import Foundation

protocol UpdateNoteDataSource {
    func updateNote(note: NoteItem) async throws
}
