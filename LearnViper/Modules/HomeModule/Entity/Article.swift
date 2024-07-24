//
//  NYTimesResponse.swift
//  LearnViper
//
//  Created by Afaq Ahmad on 22/07/2024.
//

import Foundation

import Foundation

struct NYTimesResponse: Codable {
    let status: String
    let copyright: String
    let numResults: Int
    let results: [NewsArticle]
    
    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case results
    }
}

struct NewsArticle: Codable {
    let uri: String
    let url: String
    let id: Int
    let assetId: Int
    let source: String
    let publishedDate: String
    let updated: String
    let section: String
    let subsection: String
    let nytdSection: String
    let adxKeywords: String
    let column: String?
    let byline: String
    let type: String
    let title: String
    let abstract: String
    let desFacet: [String]
    let orgFacet: [String]
    let perFacet: [String]
    let geoFacet: [String]
    let media: [Media]
    let etaId: Int
    
    enum CodingKeys: String, CodingKey {
        case uri, url, id, source, updated, section, subsection, column, byline, type, title, abstract, media
        case assetId = "asset_id"
        case publishedDate = "published_date"
        case nytdSection = "nytdsection"
        case adxKeywords = "adx_keywords"
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case etaId = "eta_id"
    }
}

struct Media: Codable {
    let type: String
    let subtype: String
    let caption: String
    let copyright: String
    let approvedForSyndication: Int
    let mediaMetadata: [MediaMetadata]
    
    enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
}

struct MediaMetadata: Codable {
    let url: String
    let format: String
    let height: Int
    let width: Int
}

