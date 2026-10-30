
import SwiftUI

struct LoginView: View {
    @State private var login = ""
    @State private var password = ""
    
    var onLogin: () -> Void

    var body: some View {
        ZStack {
            Color(red: 0.07, green: 0.07, blue: 0.12)
                .ignoresSafeArea()

            VStack(spacing: 16) {
                Text("VK")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.blue)

                Text("Добро пожаловать")
                    .foregroundStyle(.white)

                TextField("Телефон или email", text: $login)
                    .textFieldStyle(.roundedBorder)

                SecureField("Пароль", text: $password)
                    .textFieldStyle(.roundedBorder)

                Button("Войти") {
                    onLogin()
                }
                .disabled(login.isEmpty || password.isEmpty)
            }
            .padding(30)
        }
    }
}

#Preview {
    LoginView(onLogin: {})
}
