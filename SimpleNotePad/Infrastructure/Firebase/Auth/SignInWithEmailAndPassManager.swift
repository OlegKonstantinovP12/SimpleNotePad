//
//
//  Created by Oleg Konstantinov.
//

import Foundation
import FirebaseAuth

final class SignInWithEmailAndPassManager: SignInWithEmailAndPassDataSource {
    
    func signIn(email: String, password: String) async throws {
        try await Auth.auth().signIn(withEmail: email, password: password)
    }
}
