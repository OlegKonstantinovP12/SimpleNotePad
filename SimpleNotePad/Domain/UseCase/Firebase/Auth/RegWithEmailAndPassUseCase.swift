//
//
//  Created by Oleg Konstantinov.
//

import Foundation

protocol RegWithEmailAndPassUseCase: AnyObject {
    func execute(email: String, password: String) async throws
}

final class RegWithEmailAndPassUseCaseImpl: RegWithEmailAndPassUseCase {
    private let repository: RegWithEmailAndPassRepository
    init(repository: RegWithEmailAndPassRepository) {
        self.repository = repository
    }
    
    func execute(email: String, password: String) async throws {
        try await repository.createUser(email: email, password: password)
    }
}
