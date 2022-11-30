//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Henrique Akiyoshi Eguchi on 29/11/22.
//

import XCTest

class RemoteFeedLoader {
    func load() {
        HTTPClient.shared.requestedURL = URL(string: "https://a-url.com")
    }
}

class HTTPClient {
    static let shared = HTTPClient()

    private init() { }

    var requestedURL: URL?
}

final class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient.shared
        let sut = RemoteFeedLoader()
        XCTAssertNil(client.requestedURL)
    }

    func test_load_requestDataFromURL() {
        // Arrange - Given a client and a sut
        let client = HTTPClient.shared
        let sut = RemoteFeedLoader()

        // Act - When we invoke sut.load()
        sut.load()

        // Assert - Then assert that a URL request was initiated in the client
        XCTAssertNotNil(client.requestedURL)
    }

}

// Property, constructor and method injection
