//
//
//  Created by Oleg Konstantinov.
//

import Foundation

protocol SignInWithEmailAndPassUseCase: AnyObject {
    func execute(email: String, password: String) async throws
}

final class SignInWithEmailAndPassUseCaseImpl: SignInWithEmailAndPassUseCase {
    private let repository: SignInWithEmailAndPassRepository
    init(repository: SignInWithEmailAndPassRepository) {
        self.repository = repository
    }
    func execute(email: String, password: String) async throws {
        try await repository.signIn(email: email, password: password)
    }
}
