import Foundation

public extension SubmitRegistrationCodeView {
    class ViewModel: ObservableObject {
        let service: RegistrationService

        @Published public var registrationCode: String = ""

        public init(service: RegistrationService) {
            self.service = service
        }

        public func submitCode() {
            service.register(code: registrationCode)
        }
    }
}

public extension SubmitRegistrationCodeView.ViewModel {
    static func stub(withCode code: String) -> SubmitRegistrationCodeView.ViewModel {
        let viewModel = SubmitRegistrationCodeView.ViewModel.init(service: LocalRegistrationService())
        viewModel.registrationCode = code
        return viewModel
    }
}
