import SwiftUI

struct RootView: View {
    @Environment(AppState.self) private var appState

    var body: some View {
        @Bindable var appState = appState

        Group {
            if appState.isAuthenticated {
                NavigationSplitView {
                    ServerListView(
                        servers: appState.servers,
                        selectedServer: appState.selectedServer,
                        onSelect: appState.select(server:)
                    )
                } content: {
                    ChannelListView(
                        channels: appState.channels,
                        selectedChannel: appState.selectedChannel,
                        onSelect: appState.select(channel:)
                    )
                } detail: {
                    ChatView(
                        channel: appState.selectedChannel,
                        session: appState.session,
                        viewModel: appState.chatViewModel
                    )
                }
                .navigationSplitViewStyle(.balanced)
                .background(Theme.midnight)
            } else {
                NavigationStack {
                    LoginView(viewModel: LoginViewModel())
                }
            }
        }
        .task(id: appState.session?.id) {
            if appState.isAuthenticated {
                await appState.load()
            }
        }
    }
}
