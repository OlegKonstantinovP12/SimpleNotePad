//
//
//  Created by Oleg Konstantinov.
//

import Foundation

final class Assembly {
    
    static func createAppViewModel() -> AppViewModel {
        let checkDataSource = CheckSingInManager()
        let checkRepo = CheckSignInRepositoryImpl(dataSource: checkDataSource)
        let checkUseCase = CheckSingInUseCaseImpl(repository: checkRepo)
        
        return AppViewModel(checkSignInUseCase: checkUseCase)
    }
    static func createAddNoteViewModel() -> AddNoteViewModel {
        let updateDataSource = UpdateNoteFireStoreManager()
        let updateRepo = UpdateNoteRepositoryImpl(dataSource: updateDataSource)
        let updateUseCase = UpdateNoteUseCaseImpl(repository: updateRepo)
        
        let writeDataSource = WriteNoteFirestoreManager()
        let writeRepo = WriteNoteRepositoryImpl(dataSource: writeDataSource)
        let writeUseCase = WriteNoteUseCaseImpl(repository: writeRepo)
        
        return AddNoteViewModel( writeNoteUseCase: writeUseCase, updateUseCase: updateUseCase)
    }
    static func createListNotesViewModel() -> ListNotesViewModel {
        let fetchDataSource = FetchNotesFirestoreManager()
        let fetchRepo = FetchNoteRepositoryImpl(dataSource: fetchDataSource)
        let fetchUseCase = FetchNoteUseCaseImpl(repository: fetchRepo)
        
        let deleteDataSource = DeleteNoteFireStoreManager()
        let deleteRepo = DeleteNoteRepositoryImpl(dataSource: deleteDataSource)
        let deleteUseCase = DeleteNoteUseCaseImpl(repository: deleteRepo)
        
        let signOutDataSource = SignOutManager()
        let signOutRepo = SignOutRepositoryImpl(dataSource: signOutDataSource)
        let signOutUseCase = SignOutUseCaseImpl(repository: signOutRepo)
        
        return ListNotesViewModel(fetchUseCase: fetchUseCase, deleteUseCase: deleteUseCase, signOutUseCase: signOutUseCase)
    }
    
    static func createRegistrateViewModel() -> RegistrateViewModel {
        let regDataSource = RegWithEmailAndPassManager()
        let regRepo = RegWithEmailAndPassrepositoryImpl(dataSource: regDataSource)
        let regUseCase = RegWithEmailAndPassUseCaseImpl(repository: regRepo)
        return RegistrateViewModel(registrateUseCase: regUseCase)
    }
    
    static func createLoginViewModel() -> LoginViewModel {
        let signInDataSource = SignInWithEmailAndPassManager()
        let signInRepo = SignInWithEmailAndPassRepositoryImpl(dataSource: signInDataSource)
        let signInUseCase = SignInWithEmailAndPassUseCaseImpl(repository: signInRepo)
        return LoginViewModel(signInUseCase: signInUseCase)
    }
    
}
