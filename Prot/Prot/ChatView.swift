
import SwiftUI

struct ChatView: View {
    let friendName: String

    @State private var messageText = ""
    @State private var myMessage = ""
    @State private var messages: [String] = [
        "Привет!",
        "Как дела?"
    ]

    var body: some View {
        VStack {
            Text(friendName)
                .font(.title.bold())
                .padding()

            Divider()

            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(messages.indices, id: \.self) { index in
                        Text(messages[index])
                            .padding(10)
                            .background(Color.blue.opacity(0.2))
                            .clipShape(
                                RoundedRectangle(cornerRadius: 12)
                            )
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                VStack(alignment: .trailing, spacing: 12){
                    Text(myMessage)
                }
            }

            HStack {
                TextField("Сообщение...", text: $messageText)

                Button("Отправить") {
                    if !messageText.isEmpty {
                        messages.append(messageText)
                        messageText = ""
                    }
                }
                .disabled(messageText.isEmpty)
            }
            .padding()
        }
        .background(Color(red: 0.07, green: 0.07, blue: 0.12))
        .foregroundStyle(.white)
    }
}

#Preview {
    ChatView(friendName: "Alex")
}
