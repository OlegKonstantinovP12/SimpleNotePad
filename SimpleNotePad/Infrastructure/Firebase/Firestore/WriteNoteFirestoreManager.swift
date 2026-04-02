//
//
//  Created by Oleg Konstantinov.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

final class WriteNoteFirestoreManager: WriteNoteDataSource {
    func writeNote(note: NoteItem) async throws {
        guard let uid = Auth.auth().currentUser?.uid else {
            throw NSError(domain: "User not auth", code: 0)
        }
        try await Firestore.firestore()
            .collection("users")
            .document(uid)
            .collection("notes")
            .document(note.id)
            .setData(
                [
                    "title" : note.title,
                    "content" : note.content,
                    "date" : Date()
                ]
            )
    }
}
