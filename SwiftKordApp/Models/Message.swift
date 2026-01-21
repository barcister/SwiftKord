import Foundation

struct Message: Identifiable, Hashable {
    let id: UUID
    let channelID: UUID
    let author: Member
    let body: String
    let timestamp: Date
    let isCurrentUser: Bool
}
