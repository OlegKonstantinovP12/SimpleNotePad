//
//
//  Created by Oleg Konstantinov.
//

import Foundation

protocol RegWithEmailAndPassRepository {
    func createUser(email: String, password: String) async throws
}
