//
//
//  Created by Oleg Konstantinov.
//

import Foundation
import Combine

final class AppViewModel: ObservableObject {
    @Published var currentPage: PageType
    private let checkSignInUseCase: CheckSignInUseCase
    init(checkSignInUseCase: CheckSignInUseCase) {
        self.checkSignInUseCase = checkSignInUseCase
        
        if checkSignInUseCase.execute() {
            currentPage = .app
        } else {
            currentPage = .login
        }
    }
}
