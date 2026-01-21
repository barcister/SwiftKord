import SwiftUI

struct ChannelListView: View {
    let channels: [Channel]
    let selectedChannel: Channel?
    let onSelect: (Channel) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: Layout.spacingMedium) {
            Text("Channels")
                .font(.title2)
                .bold()
                .padding(.horizontal, Layout.spacingLarge)

            ScrollView {
                LazyVStack(spacing: Layout.spacingSmall) {
                    ForEach(channels) { channel in
                        Button {
                            onSelect(channel)
                        } label: {
                            HStack(spacing: Layout.spacingMedium) {
                                Image(systemName: "number")
                                    .foregroundStyle(.secondary)
                                VStack(alignment: .leading, spacing: Layout.spacingSmall) {
                                    Text(channel.name)
                                        .font(.headline)
                                    Text(channel.topic)
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                                Spacer()
                                if selectedChannel?.id == channel.id {
                                    Image(systemName: "sparkles")
                                        .foregroundStyle(Theme.gradient)
                                }
                            }
                            .padding()
                            .background(
                                Theme.surface.opacity(selectedChannel?.id == channel.id ? 0.9 : 0.4),
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
