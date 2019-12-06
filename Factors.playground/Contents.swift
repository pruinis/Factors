import UIKit
import XCTest


// MARK: - Function

func factor(x: Int) -> [Int] {
    var n = x
    var i = 2
    var factorArray = [Int]()
    
    while i * i <= n {
        while n % i == 0 {
            factorArray.append(i)
            n = n / i
        }
        i+=1
    }
    
    if n > 1 {
        factorArray.append(n)
    }
    
    return factorArray
}


// MARK: - Tests

class FactorTests: XCTestCase {
    
    // MARK: - Unit tests
    
    func testPositive() {
        XCTAssertEqual(factor(x: 0), [])
        XCTAssertEqual(factor(x: 3), [3])
        XCTAssertEqual(factor(x: 45), [3, 3, 5])
        XCTAssertEqual(factor(x: 210), [2, 3, 5, 7])
    }
    
    func testNegative() {
        XCTAssertNotEqual(factor(x: 0), [1])
        XCTAssertNotEqual(factor(x: 3), [0])
        XCTAssertNotEqual(factor(x: 45), [3, 3])
        XCTAssertNotEqual(factor(x: 210), [])
    }
    
    func testCount() {
        XCTAssertLessThan(factor(x: 0).count, 1)
        XCTAssertGreaterThan(factor(x: 45).count, 1)
        XCTAssertEqual(factor(x: 0).count, 0)
        XCTAssertEqual(factor(x: 3).count, 1)
    }
    
    func testEquability() {
        XCTAssertEqual(factor(x: 0), factor(x: 0))
        XCTAssertEqual(factor(x: 0), factor(x: -1))
        XCTAssertNotEqual(factor(x: 0), factor(x: 3))
        XCTAssertNotEqual(factor(x: 210), factor(x: 0))
    }
    
    func testNegativeValue() {
        XCTAssertEqual(factor(x: -3), [])
        XCTAssertEqual(factor(x: -45), [])
        XCTAssertEqual(factor(x: -999), [])
    }
    
    // MARK: - Performance test
    
    func testPerformance() {
        measure {
            for i in 0...100 {                
                _ = factor(x: i)
            }
        }
    }
}

FactorTests.defaultTestSuite.run()
