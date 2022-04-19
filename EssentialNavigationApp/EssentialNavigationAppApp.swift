import SwiftUI

let registrationService: RegistrationService = LocalRegistrationService()
let requestService: RegistrationRequestService = AutomaticRegistrationRequestService() {
    registerViewModel.editRegistrationCode = $0
}

let registerViewModel = RegisterViewModel(service: registrationService)
let requestRegistrationCodeViewModel = RequestRegistrationCodeViewModel(service: requestService)

let sheet = DisplaySheet()

@main
struct EssentialNavigationAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(registerViewModel)
                .environmentObject(requestRegistrationCodeViewModel)
                .environmentObject(sheet)
        }
    }
}
