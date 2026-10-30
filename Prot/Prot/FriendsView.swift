
import SwiftUI

struct FriendsView: View {
    @State private var searchText = ""

    struct Friend: Identifiable {
        let id = UUID()
        let name: String
        let age: Int
        let isOnline: Bool
    }

    let friends: [Friend] = [
        Friend(name: "Alex", age: 21, isOnline: true),
        Friend(name: "Azamat", age: 22, isOnline: false),
        Friend(name: "Mansur", age: 17, isOnline: false)
    ]

    var filteredFriends: [Friend] {
        if searchText.isEmpty {
            return friends
        } else {
            return friends.filter { friend in
                friend.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.07, green: 0.07, blue: 0.12)
                    .ignoresSafeArea()

                VStack(alignment: .leading, spacing: 12) {
                    Text("Friends")
                        .foregroundStyle(.white)
                        .font(.largeTitle.bold())

                    Divider()

                    HStack {
                        TextField("Search Friends", text: $searchText)

                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.gray)
                    }
                    .padding(12)
                    .background(.white.opacity(0.08))
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                    ForEach(filteredFriends) { friend in
                        NavigationLink {
                            ChatView(friendName: friend.name)
                        } label: {
                            HStack(spacing: 12) {
                                Circle()
                                    .fill(.blue)
                                    .frame(width: 50, height: 50)
                                    .overlay {
                                        Text(String(friend.name.prefix(1)))
                                            .foregroundStyle(.white)
                                            .fontWeight(.bold)
                                    }

                                VStack(alignment: .leading, spacing: 2) {
                                    Text(friend.name)
                                        .foregroundStyle(.white)
                                        .fontWeight(.bold)

                                    Text("\(friend.age) years")
                                        .foregroundStyle(.gray)
                                }

                                Spacer()

                                Circle()
                                    .fill(friend.isOnline ? .green : .gray)
                                    .frame(width: 10, height: 10)

                                Text(friend.isOnline ? "Online" : "Offline")
                                    .foregroundStyle(
                                        friend.isOnline ? .green : .gray
                                    )
                            }
                            .padding()
                            .background(.gray.opacity(0.1))
                            .clipShape(
                                RoundedRectangle(cornerRadius: 12)
                            )
                        }
                        .buttonStyle(.plain)
                    }

                    Spacer(minLength: 0)
                }
                .padding()
            }
            .toolbarColorScheme(.dark)
        }
    }
}

#Preview {
    FriendsView()
}
