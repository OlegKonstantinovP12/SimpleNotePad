//
//
//  Created by Oleg Konstantinov.
//

import Foundation

final class CheckSignInRepositoryImpl: CheckSignInRepository {
    
    private let dataSource: CheckSingInDataSource
    init(dataSource: CheckSingInDataSource) {
        self.dataSource = dataSource
    }
    
    func isSignIn() -> Bool {
        dataSource.isSignIn()
    }
}
