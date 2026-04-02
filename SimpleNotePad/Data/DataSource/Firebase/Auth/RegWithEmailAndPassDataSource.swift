//
//
//  Created by Oleg Konstantinov.
//

import Foundation

protocol RegWithEmailAndPassDataSource {
    func createUser(email: String, password: String) async throws
}
