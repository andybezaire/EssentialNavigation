import SwiftUI

let registrationService = LocalRegistrationService()

let registerViewModel: RegisterViewModel = {
    let viewModel = RegisterViewModel.init(service: registrationService)
    viewModel.editRegistrationCode = "inital-code"
    return viewModel
}()

let requestService = AutomaticRegistrationRequestService() { print($0) }

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
