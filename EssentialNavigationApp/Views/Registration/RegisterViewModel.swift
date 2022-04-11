import Foundation

class RegisterViewModel: ObservableObject {
    let service: RegistrationService

    @Published public var registrationCode: String?

    @Published public var editRegistrationCode: String = ""

    public init(service: RegistrationService) {
        self.service = service
        self.registrationCode = service.registrationCode
    }

    public func submitCode() {
        service.register(code: editRegistrationCode)
    }

    func unregisterCode() {
        registrationCode = service.unregister()
    }
}

extension RegisterViewModel {
    static func stub(withCode code: String) -> RegisterViewModel {
        let viewModel: RegisterViewModel = .init(service: LocalRegistrationService())
        viewModel.editRegistrationCode = code
        return viewModel
    }
}
