//
//
//  Created by Oleg Konstantinov.
//

import Foundation

final class SignInWithEmailAndPassRepositoryImpl: SignInWithEmailAndPassRepository {
    private let dataSource: SignInWithEmailAndPassDataSource
    init(dataSource: SignInWithEmailAndPassDataSource) {
        self.dataSource = dataSource
    }
    
    func signIn(email: String, password: String) async throws {
        try await dataSource.signIn(email: email, password: password)
    }
}
