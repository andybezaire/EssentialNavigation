import Foundation

public protocol RegistrationService {
    /// Current registration code from the back-end.
    /// This value is controlled by the `register(code:)` and `unregister()` methods .
    /// Will be nil if not registered.
    var registrationCode: String? { get }

    /// Registers this code with the back-end.
    /// - Parameter code: the code to be registered
    /// - Returns: `code` if successful. Returns `nil` if registration fails.
    func register(code: String) -> String?

    /// Clear the registration code from the back-end
    /// - Returns: `nil` on successful unregistering. returns the old code if unsuccessful.
    func unregister() -> String?
}
