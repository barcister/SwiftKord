import Foundation
import Observation

@MainActor
@Observable
final class AppState {
    var servers: [Server] = []
    var channels: [Channel] = []
    var messages: [Message] = []
    var selectedServer: Server?
    var selectedChannel: Channel?
    var session: UserSession?
    var chatViewModel = ChatViewModel()

    private let client: SwiftDiscClient

    init(client: SwiftDiscClient = SwiftDiscClient()) {
        self.client = client
    }

    var isAuthenticated: Bool {
        session != nil
    }

    func login(displayName: String) async {
        session = UserSession(id: UUID(), displayName: displayName, status: "Active")
        await load()
    }

    func logout() {
        session = nil
        servers = []
        channels = []
        messages = []
        selectedServer = nil
        selectedChannel = nil
        chatViewModel.update(messages: [])
    }

    func load() async {
        do {
            let servers = try await client.fetchServers()
            self.servers = servers
            self.selectedServer = servers.first

            if let server = servers.first {
                let channels = try await client.fetchChannels(serverID: server.id)
                self.channels = channels
                self.selectedChannel = channels.first

                if let channel = channels.first {
                    let fetchedMessages = try await client.fetchMessages(channelID: channel.id)
                    self.messages = fetchedMessages
                    chatViewModel.update(messages: fetchedMessages)
                }
            }
        } catch {
            loadFallbackData()
        }
    }

    func select(server: Server) {
        selectedServer = server
        channels = SampleData.channels(for: server.id)
        selectedChannel = channels.first

        if let channel = selectedChannel {
            messages = SampleData.messages(for: channel.id)
            chatViewModel.update(messages: messages)
        }
    }

    func select(channel: Channel) {
        selectedChannel = channel
        messages = SampleData.messages(for: channel.id)
        chatViewModel.update(messages: messages)
    }

    private func loadFallbackData() {
        servers = SampleData.servers
        selectedServer = SampleData.servers.first

        if let server = SampleData.servers.first {
            channels = SampleData.channels(for: server.id)
            selectedChannel = channels.first

            if let channel = channels.first {
                messages = SampleData.messages(for: channel.id)
                chatViewModel.update(messages: messages)
            }
        }
    }
}
