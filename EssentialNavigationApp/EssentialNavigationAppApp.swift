import SwiftUI

let registrationService = LocalRegistrationService()

let registerViewModel: RegisterViewModel = {
    let viewModel = RegisterViewModel.init(service: registrationService)
    return viewModel
}()

let requestService = AutomaticRegistrationRequestService() { registerViewModel.editRegistrationCode = $0 }

let requestRegistrationCodeViewModel = RequestRegistrationCodeViewModel(service: requestService)

@main
struct EssentialNavigationAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(registerViewModel)
                .environmentObject(requestRegistrationCodeViewModel)
        }
    }
}
