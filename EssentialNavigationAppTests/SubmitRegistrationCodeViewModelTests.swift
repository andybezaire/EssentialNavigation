import XCTest
import EssentialNavigationApp

class SubmitRegistrationCodeViewModelTests: XCTestCase {
    func test_submitCode_submitsCodeToService() {
        let (sut, spy) = makeSUT()
        let code = uniqueRegistrationCode()
        sut.registrationCode = code

        sut.submitCode()

        XCTAssertEqual(spy.messages.first?.description, code)
    }

    // MARK: - helpers
    func makeSUT() -> (SubmitRegistrationCodeView.ViewModel, RegistrationServiceSpy) {
        let service = RegistrationServiceSpy()
        let model = SubmitRegistrationCodeView.ViewModel(service: service)
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

extension SubmitRegistrationCodeViewModelTests.RegistrationServiceSpy: RegistrationService {
    func register(code: String) {
        messages.append(.register(code: code))
    }
}

extension SubmitRegistrationCodeViewModelTests.RegistrationServiceSpy.Message: CustomStringConvertible {
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
