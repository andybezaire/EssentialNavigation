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

extension RequestRegistrationCodeViewModel {
    static func stub() -> RequestRegistrationCodeViewModel {
        RequestRegistrationCodeViewModel.init(service: ServiceStub())
    }

    class ServiceStub: RegistrationRequestService {
        func requestCode() { }
    }
}
