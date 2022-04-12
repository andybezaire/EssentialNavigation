import SwiftUI

let registrationService = LocalRegistrationService()

let registerViewModel: RegisterViewModel = {
    let viewModel = RegisterViewModel.init(service: registrationService)
    return viewModel
}()

let requestService = AutomaticRegistrationRequestService() { registerViewModel.editRegistrationCode = $0 }

let requestRegistrationCodeViewModel = RequestRegistrationCodeViewModel(service: requestService)

class DisplaySheet: ObservableObject {
    @Published var isPresented: Bool = false
}

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
