//
//
//  Created by Oleg Konstantinov.
//

import Foundation
import SwiftUI

struct RegistrateView: View {
    @StateObject var viewModel = Assembly.createRegistrateViewModel()
    @EnvironmentObject var appViewModel: AppViewModel
    var body: some View {
        VStack {
            CustomTextField(placeholder: "Почта", field: $viewModel.email, isSecure: false)
            CustomTextField(placeholder: "Пароль", field: $viewModel.password, isSecure: true)
            VStack(spacing: 10) {
                MainButton(title: "Зарегистрироваться") {
                    Task {
                        await viewModel.registrate()                        
                    }
                }
                .onChange(of: viewModel.isRegist) { _, newValue in
                    if newValue {
                        appViewModel.currentPage = .app
                    }
                }
                HStack {
                    Text("Уже есть аккаунт?")
                    Button {
                        appViewModel.currentPage = .login
                    } label: {
                        Text("Войти")
                    }
                }


            }
        }
        .padding(.horizontal, 20)
    }
}
#Preview {
    @Previewable @State var viewModel = Assembly.createRegistrateViewModel()
    RegistrateView(viewModel: viewModel)
}
