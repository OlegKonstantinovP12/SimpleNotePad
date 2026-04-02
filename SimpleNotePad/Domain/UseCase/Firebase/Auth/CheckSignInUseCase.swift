//
//
//  Created by Oleg Konstantinov.
//

import Foundation

protocol CheckSignInUseCase: AnyObject {
    func execute() -> Bool
}

final class CheckSingInUseCaseImpl: CheckSignInUseCase {
    private let repository: CheckSignInRepository
    init(repository: CheckSignInRepository) {
        self.repository = repository
    }
    
    func execute() -> Bool {
        repository.isSignIn()
    }
}
