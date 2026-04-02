//
//
//  Created by Oleg Konstantinov.
//

import Foundation
import Combine

final class LoginViewModel: ObservableObject {
    @Published var login: String = ""
    @Published var password: String = ""
    @Published var isLogIn: Bool = false
    private let signInUseCase: SignInWithEmailAndPassUseCase
    init(signInUseCase: SignInWithEmailAndPassUseCase) {
        self.signInUseCase = signInUseCase
    }
    
    func signIn() async {
        do {
            try await signInUseCase.execute(email: login, password: password)
            self.isLogIn = true
        } catch {
            print(error)
        }
    }
    
}
