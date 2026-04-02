//
//
//  Created by Oleg Konstantinov.
//

import Foundation
import FirebaseAuth

final class CheckSingInManager: CheckSingInDataSource {
    func isSignIn() -> Bool {
        if let _ = Auth.auth().currentUser {
            return true
        } else {
            return false
        }
    }
}
