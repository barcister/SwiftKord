import Foundation

final class SwiftDiscClient {
    private let session: URLSession
    private let decoder: JSONDecoder
    private let baseURL: URL

    init(
        session: URLSession = .shared,
        baseURL: URL? = URL(string: "https://api.swiftdisc.app")
    ) {
        self.session = session
        self.baseURL = baseURL ?? URL(fileURLWithPath: "/")
        self.decoder = JSONDecoder()
        self.decoder.dateDecodingStrategy = .iso8601
    }

    func fetchServers() async throws -> [Server] {
        try await simulateNetworkDelay()
        return SampleData.servers
    }

    func fetchChannels(serverID: UUID) async throws -> [Channel] {
        try await simulateNetworkDelay()
        return SampleData.channels(for: serverID)
    }

    func fetchMessages(channelID: UUID) async throws -> [Message] {
        try await simulateNetworkDelay()
        return SampleData.messages(for: channelID)
    }

    private func simulateNetworkDelay() async throws {
        try await Task.sleep(for: .milliseconds(250))
    }
}
