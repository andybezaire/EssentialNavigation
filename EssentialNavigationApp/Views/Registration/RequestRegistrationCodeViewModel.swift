import Foundation

class RequestRegistrationCodeViewModel: ObservableObject {
    let service: RegistrationRequestService

    init(service: RegistrationRequestService) {
        self.service = service
    }

    func requestRegistrationCode() {
        service.requestCode()
    }
}
