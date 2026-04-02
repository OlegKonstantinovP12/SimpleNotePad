//
//
//  Created by Oleg Konstantinov.
//

import Foundation
import FirebaseAuth

final class SignOutManager: SignOutDataSource {
    func signOut() throws {
        try Auth.auth().signOut()
    }
}
