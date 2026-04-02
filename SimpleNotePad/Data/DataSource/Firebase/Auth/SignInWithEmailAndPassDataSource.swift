//
//
//  Created by Oleg Konstantinov.
//

import Foundation

protocol SignInWithEmailAndPassDataSource: AnyObject {
    func signIn(email: String, password: String) async throws
}
