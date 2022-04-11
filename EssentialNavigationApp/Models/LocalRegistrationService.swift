import Foundation

class LocalRegistrationService: RegistrationService {
    var registrationCode: String?
    
    func register(code: String) -> String? {
        registrationCode = code
        return registrationCode
    }

    func unregister() -> String? {
        registrationCode = nil
        return registrationCode
    }
}
