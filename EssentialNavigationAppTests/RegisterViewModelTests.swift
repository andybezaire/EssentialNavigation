import XCTest
@testable import EssentialNavigationApp

class RegisterViewModelTests: XCTestCase {
    func test_submitCode_submitsCodeToService() {
        let (sut, spy) = makeSUT()
        let code = uniqueRegistrationCode()
        sut.editRegistrationCode = code

        sut.submitCode()

        XCTAssertEqual(spy.messages.first?.description, code)
    }

    // MARK: - helpers
    func makeSUT() -> (RegisterViewModel, RegistrationServiceSpy) {
        let service = RegistrationServiceSpy()
        let model = RegisterViewModel(service: service)
        return (model, service)
    }

    class RegistrationServiceSpy {
        enum Message {
            case register(code: String)
        }

        var messages: [Message] = []
    }

    func uniqueRegistrationCode() -> String {
        "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".registrationCode()
    }
}

extension RegisterViewModelTests.RegistrationServiceSpy: RegistrationService {
    func register(code: String) {
        messages.append(.register(code: code))
    }
}

extension RegisterViewModelTests.RegistrationServiceSpy.Message: CustomStringConvertible {
    var description: String {
        switch self {
        case let .register(code: code):
            return code
        }
    }
}

extension Collection where Element: CustomStringConvertible {
    func randomElement(count: Int) -> String {
        [Int].init(repeating: 1, count: count)
            .map { _ in self.randomElement()!.description }
            .joined()
    }

    func registrationCode() -> String {
        [Int].init(repeating: 1, count: 4)
            .map { _ in self.randomElement(count: 5) }
            .joined(separator: "-")
    }
}
