import Foundation

struct Member: Identifiable, Hashable {
    let id: UUID
    let displayName: String
    let status: String
    let accentColorHex: String
}
