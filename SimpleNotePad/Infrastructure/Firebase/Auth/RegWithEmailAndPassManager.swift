//
//
//  Created by Oleg Konstantinov.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

final class RegWithEmailAndPassManager: RegWithEmailAndPassDataSource {
    
    func createUser(email: String, password: String) async throws {
        let user = try await Auth.auth().createUser(withEmail: email, password: password)
        try await user.user.sendEmailVerification()
        let userId = user.user.uid
        try await setUserData(userId: userId, userEmail: email)
    }
    
    private func setUserData(userId: String, userEmail: String) async throws {
        try await Firestore.firestore()
            .collection("users")
            .document(userId)
            .setData([
                "email" : userEmail,
                "createDate" : Date()
            ])
    }
}
