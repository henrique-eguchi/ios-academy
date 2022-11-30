//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Henrique Akiyoshi Eguchi on 29/11/22.
//

import XCTest

class RemoteFeedLoader {
    func load() {
        HTTPClient.shared.get(from: URL(string: "https://a-url.com")!)
    }
}

class HTTPClient {
    static var shared = HTTPClient()

    func get(from url: URL) {
    }
}

class HTTPClientSpy: HTTPClient {
    override func get(from url: URL) {
        requestedURL = url
    }

    var requestedURL: URL?
}

final class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        _ = RemoteFeedLoader()
        XCTAssertNil(client.requestedURL)
    }

    func test_load_requestDataFromURL() {
        // Arrange - Given a client and a sut
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        let sut = RemoteFeedLoader()

        // Act - When we invoke sut.load()
        sut.load()

        // Assert - Then assert that a URL request was initiated in the client
        XCTAssertNotNil(client.requestedURL)
    }

}

// Property, constructor and method injection
