import SwiftUI

struct MessageComposerView: View {
    @Binding var text: String
    let onSend: () -> Void

    var body: some View {
        HStack(spacing: Layout.spacingMedium) {
            Button("Add", systemImage: "plus.circle.fill") {}
                .font(.callout)
                .foregroundStyle(Theme.gradient)

            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Text("Message #general")
                        .foregroundStyle(.secondary)
                }

                TextField("", text: $text, axis: .vertical)
                    .textFieldStyle(.plain)
                    .foregroundStyle(.white)
                    .lineLimit(1...4)
            }
            .padding(.horizontal, Layout.spacingMedium)
            .padding(.vertical, Layout.spacingSmall)
            .background(Theme.midnight.opacity(0.7), in: .rect(cornerRadius: Layout.cornerRadiusSmall))

            Button("Send", systemImage: "paperplane.fill", action: onSend)
                .font(.callout)
                .foregroundStyle(Theme.gradient)
        }
    }
}
