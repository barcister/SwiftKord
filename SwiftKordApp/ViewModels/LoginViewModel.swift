import Foundation
import Observation

@MainActor
@Observable
final class LoginViewModel {
    var displayName = ""
    var isLoading = false

    func submit(using appState: AppState) async {
        guard !displayName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return
        }

        isLoading = true
        await appState.login(displayName: displayName)
        isLoading = false
    }
}
