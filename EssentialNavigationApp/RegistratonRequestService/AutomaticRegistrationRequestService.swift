import Foundation

/// Runs the `sendCode` closure after 1 second.
/// Add your function to receive the code one second after sending.
class AutomaticRegistrationRequestService: RegistrationRequestService {
    var sendCode: ((String) -> Void)?

    init(sendCode: ((String) -> Void)? = nil) {
        self.sendCode = sendCode
    }

    func requestCode() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.sendCode?("01234-56789-01234-56789")
        }
    }
}
