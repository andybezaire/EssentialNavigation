import Foundation

class RegisterViewModel: ObservableObject {
    let service: RegistrationService

    @Published public var registrationCode: String?

    @Published public var editRegistrationCode: String = ""

    var isRegistered: Bool { registrationCode != nil }

    public init(service: RegistrationService) {
        self.service = service
        self.registrationCode = service.registrationCode
    }

    public func submitCode() {
        registrationCode = service.register(code: editRegistrationCode)
        editRegistrationCode = ""
    }

    func unregisterCode() {
        registrationCode = service.unregister()
    }
}

extension RegisterViewModel {
    static func stub(withCode code: String = "stub-code") -> RegisterViewModel {
        let viewModel: RegisterViewModel = .init(service: LocalRegistrationService())
        viewModel.editRegistrationCode = code
        return viewModel
    }
}
