//
//
//  Created by Oleg Konstantinov.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

final class FetchNotesFirestoreManager: FetchNoteDataSource {
    
    func fetchNotes() async throws -> [NoteItem] {
        guard let uid = Auth.auth().currentUser?.uid else {
            throw NSError(domain: "User not auth", code: 0)
        }
        var notes: [NoteItem] = []
        
        let documents = try await Firestore.firestore()
            .collection("users")
            .document(uid)
            .collection("notes")
            .getDocuments()
            
        
        documents.documents.forEach { document in
            let note = NoteItem(id: document.documentID, data: document.data())
            notes.append(note)
        }
        return notes
    }
}
