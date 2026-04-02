//
//
//  Created by Oleg Konstantinov.
//

import Foundation
import Combine

final class RegistrateViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isRegist: Bool = false
    
    private let registrateUseCase: RegWithEmailAndPassUseCase
    init(registrateUseCase: RegWithEmailAndPassUseCase) {
        self.registrateUseCase = registrateUseCase
    }
    
    func registrate() async {
        do {
           try await registrateUseCase.execute(email: email, password: password)
            self.isRegist = true
        } catch {
            print(error)
        }
    }
}
