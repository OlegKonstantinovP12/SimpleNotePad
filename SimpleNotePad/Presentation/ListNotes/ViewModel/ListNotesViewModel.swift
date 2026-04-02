//
//
//  Created by Oleg Konstantinov.
//

import Foundation
import Combine


final class ListNotesViewModel: ObservableObject {
    @Published var notes: [NoteItem] = []
    
    private let fetchUseCase: FetchNoteUseCase
    private let deleteUseCase: DeleteNoteUseCase
    private let signOutUseCase: SignOutUseCase
    init(fetchUseCase: FetchNoteUseCase, deleteUseCase: DeleteNoteUseCase, signOutUseCase: SignOutUseCase) {
        self.fetchUseCase = fetchUseCase
        self.deleteUseCase = deleteUseCase
        self.signOutUseCase = signOutUseCase
    }
    
    func getNotes() async {
        do {
            self.notes = try await fetchUseCase.execute()
        } catch {
            print(error)
        }
    }
    
    func deleteNote(id: String) async {
        do {
           try await deleteUseCase.execute(id: id)
        } catch {
            print( error)
        }
    }
    
    func signOut() {
        do {
            try signOutUseCase.execute()
        } catch {
            print(error)
        }
    }
}
