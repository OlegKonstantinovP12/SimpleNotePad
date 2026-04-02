//
//
//  Created by Oleg Konstantinov.
//

import Foundation

final class SignOutRepositoryImpl: SignOutRepository {
    private let dataSource: SignOutDataSource
    init(dataSource: SignOutDataSource) {
        self.dataSource = dataSource
    }
    
    func signOut() throws {
        try dataSource.signOut()
    }
}
