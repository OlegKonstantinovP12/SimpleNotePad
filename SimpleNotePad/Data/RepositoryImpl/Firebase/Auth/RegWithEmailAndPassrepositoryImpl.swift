//
//
//  Created by Oleg Konstantinov.
//

import Foundation

final class RegWithEmailAndPassrepositoryImpl: RegWithEmailAndPassRepository {
    private let dataSource: RegWithEmailAndPassDataSource
    init(dataSource: RegWithEmailAndPassDataSource) {
        self.dataSource = dataSource
    }
    
    func createUser(email: String, password: String) async throws {
        try await dataSource.createUser(email: email, password: password)
    }
}
