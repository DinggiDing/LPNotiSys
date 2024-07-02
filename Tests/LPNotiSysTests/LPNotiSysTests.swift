import XCTest
import SwiftUI
import ViewInspector
@testable import LPNotiSys

extension LPNotiSysView: Inspectable {}

final class LPNotiSysTests: XCTestCase {
//    func testExample() throws {
//        // XCTest Documentation
//        // https://developer.apple.com/documentation/xctest
//
//        // Defining Test Cases and Test Methods
//        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
//    }
    
//    func testToggleNotification() throws {
//        let view = LPNotiSysView()
//        let exp = view.inspect().find(ViewType.Toggle.self, where: { toggle in
//            try toggle.labelView().text().string() == "알림"
//        }).toggle()
//        XCTAssertTrue(try exp.isOn())
//    }
    
    func testExample() throws {
       let view = LPNotiSysView()
       let inspector = try view.inspect()
       
       // 테스트 코드를 작성하여 뷰의 상태를 검사합니다.
       // 예를 들어, "Notification" 텍스트가 있는지 확인합니다.
       let text = try inspector.find(text: "Notification")
       XCTAssertNotNil(text)
   }
}
