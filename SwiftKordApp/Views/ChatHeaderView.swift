import SwiftUI

struct ChatHeaderView: View {
    @Environment(AppState.self) private var appState
    let channel: Channel?
    let session: UserSession?

    var body: some View {
        HStack(spacing: Layout.spacingLarge) {
            VStack(alignment: .leading, spacing: Layout.spacingSmall) {
                Text(channel?.name ?? "Select a channel")
                    .font(.title2)
                    .bold()
                Text(channel?.topic ?? "Find a space to start chatting")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            HStack(spacing: Layout.spacingMedium) {
                Button("Search", systemImage: "magnifyingglass") {}
                Button("Alerts", systemImage: "bell.badge") {}
                Button("Members", systemImage: "person.2.fill") {}
                if session != nil {
                    Button("Sign out", systemImage: "arrow.turn.up.left") {
                        appState.logout()
                    }
                }
            }
            .buttonStyle(.borderless)
            .font(.caption)
            .foregroundStyle(.secondary)
        }
        .padding(.horizontal, Layout.spacingExtraLarge)
        .padding(.vertical, Layout.spacingMedium)
        .background(
            ZStack {
                Theme.gradient.opacity(0.2)
                Theme.surface.opacity(0.9)
            }
        )
        .overlay(
            Divider()
                .background(.white.opacity(0.05)),
            alignment: .bottom
        )
    }
}
