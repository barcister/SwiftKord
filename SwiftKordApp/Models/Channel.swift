import Foundation

struct Channel: Identifiable, Hashable {
    let id: UUID
    let serverID: UUID
    let name: String
    let topic: String
}
