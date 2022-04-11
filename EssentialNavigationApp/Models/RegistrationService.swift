import Foundation

public protocol RegistrationService {
    var registrationCode: String? { get }

    func register(code: String)
}
