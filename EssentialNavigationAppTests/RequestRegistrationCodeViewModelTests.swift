//
//  RequestRegistrationCodeViewModelTests.swift
//  EssentialNavigationAppTests
//
//  Created by Andy Bezaire on 11.4.2022.
//

import XCTest
@testable import EssentialNavigationApp

class RequestRegistrationCodeViewModelTests: XCTestCase {
    func test_requestRegistrationCode_requestsCorrectCodeFromService() {
        let (sut, spy) = makeSUT()

        sut.requestRegistrationCode()

        XCTAssertEqual(spy.messages.first, .requestCode)
    }

    // MARK: - helpers
    func makeSUT() -> (RequestRegistrationCodeViewModel, RegistrationRequestServiceSpy) {
        let service = RegistrationRequestServiceSpy()
        let model = RequestRegistrationCodeViewModel(service: service)
        return (model, service)
    }

    class RegistrationRequestServiceSpy {
        enum Message {
            case requestCode
        }
        var messages: [Message] = []
    }
}

extension RequestRegistrationCodeViewModelTests.RegistrationRequestServiceSpy: RegistrationRequestService {
    func requestCode() {
        messages.append(.requestCode)
    }
}
