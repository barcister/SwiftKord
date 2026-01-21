import SwiftUI

struct AvatarView: View {
    let initials: String
    let color: Color

    var body: some View {
        ZStack {
            Circle()
                .fill(color)
                .frame(width: Layout.avatarSize, height: Layout.avatarSize)
                .overlay(
                    Circle()
                        .strokeBorder(.white.opacity(0.2), lineWidth: 1)
                )

            Text(initials)
                .font(.caption)
                .bold()
                .foregroundStyle(.white)
        }
    }
}
