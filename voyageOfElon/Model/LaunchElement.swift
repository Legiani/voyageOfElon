// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let launch = try Launch(json)

import Foundation

// MARK: - LaunchElement
struct LaunchElement: Codable{
    let fairings: Fairings?
    let links: Links
    let staticFireDateUtc: String?
    let staticFireDateUnix: Int?
    let net: Bool
    let window: Int?
    let rocket: String
    let success: Bool
    let failures: [Failure]
    let details: String?
    let crew: [Crew]
    let ships, capsules, payloads: [String]
    let launchpad: String
    let flightNumber: Int?
    let name: String
    let dateUnix, dateUtc: String?
    let dateLocal: Date?
    let datePrecision: String?
    let upcoming: Bool
    let cores: [Core]
    let autoUpdate, tbd: Bool?
    let launchLibraryId: String?
    let id: String
}

// MARK: - Core
struct Core: Codable {
    let core: String
    let flight: Int
    let gridfins, legs, reused: Bool
    let landingSuccess, landingAttempt: Bool?
    let landingType, landpad: String?
}

// MARK: - Crew
struct Crew: Codable {
    let crew, role: String
}

// MARK: - Failure
struct Failure: Codable {
    let time: Int
    let altitude: Int?
    let reason: String
}

// MARK: - Fairings
struct Fairings: Codable {
    let reused, recoveryAttempt, recovered: Bool?
    let ships: [String]
}

// MARK: - Links
struct Links: Codable {
    let patch: Patch
    let reddit: Reddit
    let flickr: Flickr
    let presskit: String?
    let webcast: String
    let youtubeId: String?
    let article: String?
    let wikipedia: String?
}

// MARK: - Flickr
struct Flickr: Codable {
    let small: [String?]
    let original: [String]
}

// MARK: - Patch
struct Patch: Codable {
    let small, large: String
}

// MARK: - Reddit
struct Reddit: Codable {
    let campaign: String?
    let launch: String?
    let media, recovery: String?
}
