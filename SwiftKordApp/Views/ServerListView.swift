import SwiftUI

struct ServerListView: View {
    let servers: [Server]
    let selectedServer: Server?
    let onSelect: (Server) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: Layout.spacingLarge) {
            HStack {
                Text("Servers")
                    .font(.title2)
                    .bold()
                Spacer()
                Image(systemName: "sparkles")
                    .foregroundStyle(Theme.gradient)
            }
            .padding(.horizontal, Layout.spacingLarge)

            ScrollView {
                LazyVStack(spacing: Layout.spacingMedium) {
                    ForEach(servers) { server in
                        let isSelected = selectedServer?.id == server.id

                        Button {
                            onSelect(server)
                        } label: {
                            HStack(spacing: Layout.spacingMedium) {
                                ZStack {
                                    Circle()
                                        .fill(Color(hex: server.colorHex))
                                        .frame(width: Layout.serverIconSize, height: Layout.serverIconSize)
                                        .shadow(color: Theme.glow.opacity(0.3), radius: Layout.spacingMedium, x: 0, y: Layout.spacingSmall)

                                    Image(systemName: server.icon)
                                        .foregroundStyle(.white)
                                }

                                VStack(alignment: .leading, spacing: Layout.spacingSmall) {
                                    Text(server.name)
                                        .font(.headline)
                                    Text("72 online · 12 new")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                                Spacer()
                            }
                            .padding()
                            .background(
                                isSelected ? Theme.gradient : Theme.surface.opacity(0.5),
                                in: .rect(cornerRadius: Layout.cornerRadiusLarge)
                            )
                            .overlay(
                                .rect(cornerRadius: Layout.cornerRadiusLarge)
                                    .strokeBorder(.white.opacity(0.08), lineWidth: 1)
                            )
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, Layout.spacingLarge)
                .padding(.bottom, Layout.spacingLarge)
            }
        }
        .padding(.top, Layout.spacingLarge)
        .background(Theme.midnight)
    }
}
