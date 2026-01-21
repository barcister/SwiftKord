import Foundation

struct UserSession: Identifiable, Hashable {
    let id: UUID
    let displayName: String
    let status: String
}
