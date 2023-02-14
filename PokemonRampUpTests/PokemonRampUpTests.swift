//
//  PokemonRampUpTests.swift
//  PokemonRampUpTests
//
//  Created by Thushen Mohanarajah on 2023-02-13.
//

import XCTest
@testable import PokemonRampUp

final class PokemonRampUpTests: XCTestCase {

//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
    func testPokemonDecoding() {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "pikachu_response", withExtension: "json"),
            let data = try? Data(contentsOf: url) else {
                return
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
//        decoder.dateDecodingStrategy = .secondsSince1970
        guard let pikachu = try? decoder.decode(Pokemon.self, from: data) else {
            print("Failed")
            return
        }
        
        let ablitiesTest = [PokemonAbility]()
        XCTAssertEqual(pikachu.name, "bob")
        XCTAssertEqual(pikachu.abilities, ablitiesTest)
//        XCTAssertEqual(launch.missionName, "Telstar 19V")
//        XCTAssertEqual(launch.launchDateUnix, Date(timeIntervalSince1970: 1532238600))
//        XCTAssertEqual(launch.launchSuccess, true)
    }

}
