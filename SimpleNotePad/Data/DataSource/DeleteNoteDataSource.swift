//
//
//  Created by Oleg Konstantinov.
//

import Foundation

protocol DeleteNoteDataSource {
    func deleteNote(id: String) async throws
}
