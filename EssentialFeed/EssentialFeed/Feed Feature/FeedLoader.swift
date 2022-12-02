//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Henrique Akiyoshi Eguchi on 29/11/22.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
