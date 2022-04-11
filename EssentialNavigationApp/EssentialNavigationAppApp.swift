import SwiftUI

let registrationService = LocalRegistrationService()
let registerViewModel: RegisterViewModel = {
    let viewModel = RegisterViewModel.init(service: registrationService)
    viewModel.editRegistrationCode = "inital-code"
    return viewModel
}()

@main
struct EssentialNavigationAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(registerViewModel)
        }
    }
}
