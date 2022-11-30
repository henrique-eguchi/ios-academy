//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Henrique Akiyoshi Eguchi on 29/11/22.
//

import XCTest

class RemoteFeedLoader {
    let client: HTTPClient
    init(client: HTTPClient) {
        self.client = client
    }
    func load() {
        client.get(from: URL(string: "https://a-url.com")!)
    }
}

protocol HTTPClient {
    func get(from url: URL)
}

class HTTPClientSpy: HTTPClient {
    func get(from url: URL) {
        requestedURL = url
    }

    var requestedURL: URL?
}

final class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        _ = RemoteFeedLoader(client: client)
        XCTAssertNil(client.requestedURL)
    }

    func test_load_requestDataFromURL() {
        // Arrange - Given a client and a sut
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(client: client)

        // Act - When we invoke sut.load()
        sut.load()

        // Assert - Then assert that a URL request was initiated in the client
        XCTAssertNotNil(client.requestedURL)
    }

}

// Property, constructor and method injection
