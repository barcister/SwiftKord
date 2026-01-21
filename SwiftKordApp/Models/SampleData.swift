import Foundation

enum SampleData {
    static let servers: [Server] = [
        Server(id: UUID(), name: "SwiftKord", icon: "swift", colorHex: "#FF7A59"),
        Server(id: UUID(), name: "Design Lab", icon: "paintpalette.fill", colorHex: "#7A5CFF"),
        Server(id: UUID(), name: "Vision Lounge", icon: "visionpro", colorHex: "#00C2A8")
    ]

    static func channels(for serverID: UUID) -> [Channel] {
        [
            Channel(id: UUID(), serverID: serverID, name: "general", topic: "The heartbeat of the community"),
            Channel(id: UUID(), serverID: serverID, name: "product-hunt", topic: "Ship weekly, learn daily"),
            Channel(id: UUID(), serverID: serverID, name: "swiftui", topic: "Elegant interfaces across devices"),
            Channel(id: UUID(), serverID: serverID, name: "music", topic: "Lo-fi beats and focus flows")
        ]
    }

    static func messages(for channelID: UUID) -> [Message] {
        let aura = Member(id: UUID(), displayName: "Aura", status: "Online", accentColorHex: "#7A5CFF")
        let nova = Member(id: UUID(), displayName: "Nova", status: "Designing", accentColorHex: "#FF7A59")
        let you = Member(id: UUID(), displayName: "You", status: "Active", accentColorHex: "#00C2A8")

        return [
            Message(
                id: UUID(),
                channelID: channelID,
                author: aura,
                body: "Morning! The new liquid glass gradients are ready. Want the palette?",
                timestamp: Date().addingTimeInterval(-3600),
                isCurrentUser: false
            ),
            Message(
                id: UUID(),
                channelID: channelID,
                author: nova,
                body: "I dropped them in the design channel. Pairing them with bold type feels so clean.",
                timestamp: Date().addingTimeInterval(-3300),
                isCurrentUser: false
            ),
            Message(
                id: UUID(),
                channelID: channelID,
                author: you,
                body: "Just saw them — we should use the aurora gradient for the header glow.",
                timestamp: Date().addingTimeInterval(-3000),
                isCurrentUser: true
            ),
            Message(
                id: UUID(),
                channelID: channelID,
                author: aura,
                body: "Love it. I can prep a swift asset catalog for the iOS 26 build.",
                timestamp: Date().addingTimeInterval(-2400),
                isCurrentUser: false
            ),
            Message(
                id: UUID(),
                channelID: channelID,
                author: you,
                body: "Let’s sync at 2. The visionOS layout needs a little extra depth.",
                timestamp: Date().addingTimeInterval(-2100),
                isCurrentUser: true
            )
        ]
    }
}
