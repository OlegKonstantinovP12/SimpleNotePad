//
//
//  Created by Oleg Konstantinov.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = Assembly.createLoginViewModel()
    @EnvironmentObject var appViewModel: AppViewModel
    var body: some View {
        VStack(spacing: 10) {
            CustomTextField(placeholder: "E-mail", field: $viewModel.login, isSecure: false)
            CustomTextField(placeholder: "Password", field: $viewModel.password, isSecure: true)
            VStack {
                MainButton(title: "Войти") {
                    Task {
                        await viewModel.signIn()
                    }
                }
                VStack {
                    Text("Еще нет аккаунта?")
                    Button {
                        appViewModel.currentPage = .regist
                    } label: {
                        Text("Зарегистрироваться")
                    }
                    .onChange(of: viewModel.isLogIn) { _, newValue in
                        if newValue {
                            appViewModel.currentPage = .app
                        }
                    }
                }
            }
            .padding(.horizontal, 60)
            
            
        }
        .padding(.horizontal, 20)
        
    }
}



#Preview {
    LoginView()
}
