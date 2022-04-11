import SwiftUI

let registrationService = LocalRegistrationService()
let submitRegistrationViewModel:SubmitRegistrationCodeView.ViewModel = {
    let viewModel = SubmitRegistrationCodeView.ViewModel.init(service: registrationService)
    viewModel.registrationCode = "inital-code"
    return viewModel
}()

@main
struct EssentialNavigationAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(submitRegistrationViewModel)
        }
    }
}
