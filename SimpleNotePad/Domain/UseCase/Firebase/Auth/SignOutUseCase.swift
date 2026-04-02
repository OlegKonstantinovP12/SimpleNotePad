//
//
//  Created by Oleg Konstantinov.
//

import Foundation

protocol SignOutUseCase: AnyObject {
    func execute() throws
}

final class SignOutUseCaseImpl: SignOutUseCase {
    private let repository: SignOutRepository
    init(repository: SignOutRepository) {
        self.repository = repository
    }
    
    func execute() throws {
        try repository.signOut()
    }
}
