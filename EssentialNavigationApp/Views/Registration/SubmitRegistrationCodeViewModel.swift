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
