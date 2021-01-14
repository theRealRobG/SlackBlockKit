import Foundation
import XCTest

func AssertJSONEqual(
    _ lhs: String,
    _ rhs: String,
    file: StaticString = #file,
    line: UInt = #line
) {
    guard let lhsData = lhs.data(using: .utf8) else {
        XCTFail("\(lhs) could not be converted to data", file: file, line: line)
        return
    }
    guard let rhsData = rhs.data(using: .utf8) else {
        XCTFail("\(rhs) could not be converted to data", file: file, line: line)
        return
    }
    do {
        let lhsJSONObject = try JSONSerialization.jsonObject(with: lhsData)
        let lhsJSONData = try JSONSerialization.data(withJSONObject: lhsJSONObject, options: .sortedKeys)
        let rhsJSONObject = try JSONSerialization.jsonObject(with: rhsData)
        let rhsJSONData = try JSONSerialization.data(withJSONObject: rhsJSONObject, options: .sortedKeys)
        
        guard let lhsJSONString = String(data: lhsJSONData, encoding: .utf8), let rhsJSONString = String(data: rhsJSONData, encoding: .utf8) else {
            return XCTFail("JSON serialized data was not convertible to String", file: file, line: line)
        }
        
        XCTAssertEqual(lhsJSONString, rhsJSONString, file: file, line: line)
    } catch {
        XCTFail("Problem decoding/encoding JSON: \(error.localizedDescription)", file: file, line: line)
    }
}
