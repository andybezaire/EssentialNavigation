import XCTest
@testable import EssentialNavigationApp

class RegisterViewModelTests: XCTestCase {
    func test_submitCode_submitsCodeToServiceAndSetsCodeAndClearsEdits() {
        let (sut, spy) = makeSUT()
        let code = uniqueRegistrationCode()
        sut.editRegistrationCode = code

        sut.submitCode()

        XCTAssertEqual(spy.messages.first?.description, code)
        XCTAssertEqual(sut.registrationCode, code)
        XCTAssertTrue(sut.editRegistrationCode.isEmpty, "Expected empty but got \(sut.editRegistrationCode)")
    }

    func test_initWithNoCodeService_initsWithNoCode() {
        let (sut, _) = makeSUT()

        XCTAssertNil(sut.registrationCode)
    }

    func test_initWithUniqueCodeService_initsWithUniqueCode() {
        let code = uniqueRegistrationCode()
        let (sut, _) = makeSUT(withServiceCode: code)

        XCTAssertEqual(sut.registrationCode, code)
    }

    func test_unregister_callsServiceAndClearsCode() {
        let code = uniqueRegistrationCode()
        let (sut, spy) = makeSUT(withServiceCode: code)

        sut.unregisterCode()

        XCTAssertEqual(spy.messages.first?.description, "message: unregister()")
        XCTAssertNil(sut.registrationCode)
    }

    // MARK: - helpers
    func makeSUT(withServiceCode code: String? = nil) -> (RegisterViewModel, RegistrationServiceSpy) {
        let service = RegistrationServiceSpy()
        service.registrationCode = code
        let model = RegisterViewModel(service: service)
        return (model, service)
    }

    class RegistrationServiceSpy {
        var registrationCode: String?

        enum Message {
            case register(code: String)
            case unregister
        }

        var messages: [Message] = []
    }

    func uniqueRegistrationCode() -> String {
        "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".registrationCode()
    }
}

extension RegisterViewModelTests.RegistrationServiceSpy: RegistrationService {
    func register(code: String) -> String? {
        messages.append(.register(code: code))
        return code
    }

    func unregister() -> String? {
        messages.append(.unregister)
        return nil
    }
}

extension RegisterViewModelTests.RegistrationServiceSpy.Message: CustomStringConvertible {
    var description: String {
        switch self {
        case let .register(code: code):
            return code
        case .unregister:
            return "message: unregister()"
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
