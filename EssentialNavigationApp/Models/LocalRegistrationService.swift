import Foundation

class LocalRegistrationService: RegistrationService {
    var registrationCode: String?
    
    func register(code: String) -> String? {
        registrationCode = "local-code"
        return registrationCode
    }

    func unregister() -> String? {
        registrationCode = nil
        return registrationCode
    }
}
