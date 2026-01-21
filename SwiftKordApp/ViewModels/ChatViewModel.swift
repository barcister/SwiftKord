import Foundation
import Observation

@MainActor
@Observable
final class ChatViewModel {
    var messages: [Message] = []
    var composerText = ""

    func update(messages: [Message]) {
        self.messages = messages
    }

    func sendMessage(from user: UserSession?, in channel: Channel?) {
        guard let channel, let user, !composerText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return
        }

        let member = Member(
            id: user.id,
            displayName: user.displayName,
            status: user.status,
            accentColorHex: "#00C2A8"
        )

        let message = Message(
            id: UUID(),
            channelID: channel.id,
            author: member,
            body: composerText,
            timestamp: Date(),
            isCurrentUser: true
        )

        messages.append(message)
        composerText = ""
    }
}
