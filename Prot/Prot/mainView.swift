
import SwiftUI

struct mainView: View {
    @State private var isLoggedIn = false

    var body: some View {
        if isLoggedIn {
            FriendsView()
        } else {
            LoginView {
                isLoggedIn = true
            }
        }
    }
}

#Preview {
    mainView()
}
