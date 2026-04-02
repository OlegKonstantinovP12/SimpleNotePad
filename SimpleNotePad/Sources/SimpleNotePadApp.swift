//
//
//  Created by Oleg Konstantinov.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct SimpleNotePadApp: App {
    @StateObject var viewModel = Assembly.createAppViewModel()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            switch viewModel.currentPage {
            case .regist:
                RegistrateView()
                    .environmentObject(viewModel)
            case .login:
                LoginView()
                    .environmentObject(viewModel)
            case .app:
                ListNotes()
                    .environmentObject(viewModel)
            }
            
        }
    }
}
