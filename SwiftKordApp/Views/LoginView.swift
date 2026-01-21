import SwiftUI

struct LoginView: View {
    @Environment(AppState.self) private var appState
    @Bindable var viewModel: LoginViewModel

    var body: some View {
        VStack(spacing: Layout.spacingLarge) {
            VStack(spacing: Layout.spacingSmall) {
                Text("SwiftKord")
                    .font(.largeTitle)
                    .bold()
                Text("Sign in to continue your conversations across iOS, macOS, iPadOS, and visionOS.")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
            }

            VStack(spacing: Layout.spacingMedium) {
                TextField("Display name", text: $viewModel.displayName)
                    .textFieldStyle(.roundedBorder)

                Button("Continue", systemImage: "arrow.right") {
                    Task {
                        await viewModel.submit(using: appState)
                    }
                }
                .buttonStyle(.borderedProminent)
                .disabled(viewModel.displayName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Theme.midnight)
    }
}
