import SwiftUI

enum Theme {
    static let accent = Color(red: 0.46, green: 0.38, blue: 1)
    static let glow = Color(red: 0.0, green: 0.85, blue: 0.72)
    static let midnight = Color(red: 0.08, green: 0.09, blue: 0.14)
    static let surface = Color(red: 0.12, green: 0.14, blue: 0.2)

    static let gradient = LinearGradient(
        colors: [Color(red: 0.45, green: 0.2, blue: 0.95), Color(red: 0.0, green: 0.8, blue: 0.75)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
