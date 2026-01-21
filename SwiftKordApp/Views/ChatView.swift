import SwiftUI

struct ChatView: View {
    let channel: Channel?
    let session: UserSession?
    @Bindable var viewModel: ChatViewModel

    var body: some View {
        VStack(spacing: 0) {
            ChatHeaderView(channel: channel, session: session)

            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(spacing: Layout.spacingLarge) {
                        ForEach(viewModel.messages) { message in
                            MessageBubbleView(message: message)
                                .id(message.id)
                        }
                    }
                    .padding(.horizontal, Layout.spacingExtraLarge)
                    .padding(.vertical, Layout.spacingLarge)
                }
                .background(
                    LinearGradient(
                        colors: [Theme.midnight, Theme.surface.opacity(0.4)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .onChange(of: viewModel.messages.count) { _, _ in
                    if let last = viewModel.messages.last {
                        withAnimation(.easeInOut) {
                            proxy.scrollTo(last.id, anchor: .bottom)
                        }
                    }
                }
            }

            MessageComposerView(text: $viewModel.composerText) {
                viewModel.sendMessage(from: session, in: channel)
            }
            .padding(.horizontal, Layout.spacingExtraLarge)
            .padding(.vertical, Layout.spacingMedium)
            .background(Theme.surface.opacity(0.9))
            .background(.ultraThinMaterial)
        }
        .background(Theme.midnight)
    }
}
