import Foundation

class RegisterViewModel: ObservableObject {
    let service: RegistrationService

    @Published public var registrationCode: String = ""

    public init(service: RegistrationService) {
        self.service = service
    }

    public func submitCode() {
        service.register(code: registrationCode)
    }
}

extension RegisterViewModel {
    static func stub(withCode code: String) -> RegisterViewModel {
        let viewModel: RegisterViewModel = .init(service: LocalRegistrationService())
        viewModel.registrationCode = code
        return viewModel
    }
}
