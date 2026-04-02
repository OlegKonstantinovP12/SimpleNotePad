//
//
//  Created by Oleg Konstantinov.
//

import Foundation

protocol FetchNoteDataSource: AnyObject {
    func fetchNotes() async throws -> [NoteItem]
}
