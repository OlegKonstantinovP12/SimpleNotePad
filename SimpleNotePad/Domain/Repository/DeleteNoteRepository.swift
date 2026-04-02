//
//
//  Created by Oleg Konstantinov.
//

import Foundation

protocol DeleteNoteRepository {
    func deleteNote(id: String) async throws
}
