//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Henrique Akiyoshi Eguchi on 29/11/22.
//

import XCTest

class RemoteFeedLoader {
    let client: HTTPClient
    let url: URL
    init(url: URL,
         client: HTTPClient) {
        self.client = client
        self.url = url
    }
    func load() {
        client.get(from: url)
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
        let url = URL(string: "https://a-given-url.com")!
        let client = HTTPClientSpy()
        _ = RemoteFeedLoader(url: url, client: client)
        XCTAssertNil(client.requestedURL)
    }

    func test_load_requestDataFromURL() {
        // Arrange - Given a client and a sut
        let url = URL(string: "https://a-given-url.com")!
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)

        // Act - When we invoke sut.load()
        sut.load()

        // Assert - Then assert that a URL request was initiated in the client
        XCTAssertEqual(client.requestedURL, url)
    }

}

// Property, constructor and method injection
