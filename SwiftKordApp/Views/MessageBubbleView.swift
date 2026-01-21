import SwiftUI

struct MessageBubbleView: View {
    let message: Message

    var body: some View {
        HStack(alignment: .bottom, spacing: Layout.spacingMedium) {
            if !message.isCurrentUser {
                AvatarView(initials: String(message.author.displayName.prefix(2)), color: Color(hex: message.author.accentColorHex))
            } else {
                Spacer(minLength: Layout.spacingExtraLarge)
            }

            VStack(alignment: message.isCurrentUser ? .trailing : .leading, spacing: Layout.spacingSmall) {
                if !message.isCurrentUser {
                    Text(message.author.displayName)
                        .font(.caption)
                        .bold()
                        .foregroundStyle(.secondary)
                }

                Text(message.body)
                    .font(.body)
                    .padding(.vertical, Layout.spacingSmall)
                    .padding(.horizontal, Layout.spacingMedium)
                    .background(
                        message.isCurrentUser ? Theme.gradient : Theme.surface.opacity(0.8),
                        in: .rect(cornerRadius: Layout.cornerRadiusMedium)
                    )
                    .overlay(
                        .rect(cornerRadius: Layout.cornerRadiusMedium)
                            .strokeBorder(.white.opacity(message.isCurrentUser ? 0.0 : 0.08), lineWidth: 1)
                    )
                    .foregroundStyle(.white)

                Text(message.timestamp.formatted(date: .omitted, time: .shortened))
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }

            if message.isCurrentUser {
                AvatarView(initials: "Me", color: Theme.glow)
            } else {
                Spacer(minLength: Layout.spacingExtraLarge)
            }
        }
        .frame(maxWidth: .infinity, alignment: message.isCurrentUser ? .trailing : .leading)
    }
}
