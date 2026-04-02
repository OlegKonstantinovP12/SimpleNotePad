//
//
//  Created by Oleg Konstantinov.
//

import Foundation

protocol SignInWithEmailAndPassRepository: AnyObject {
    func signIn(email: String, password: String) async throws
}
