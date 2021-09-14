// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let launch = try? newJSONDecoder().decode(Launch.self, from: jsonData)

import Foundation

// MARK: - LaunchElement
struct LaunchElement {
    let fairings: NSNull
    let links: Links
    let staticFireDateUTC: String
    let staticFireDateUnix: Int
    let tdb, net: Bool
    let window: Int
    let rocket: String
    let success: Bool
    let failures: [Any?]
    let details: String
    let crew, ships: [Any?]
    let capsules, payloads: [String]
    let launchpad: String
    let autoUpdate: Bool
    let flightNumber: Int
    let name, dateUTC: String
    let dateUnix: Int
    let dateLocal: Date
    let datePrecision: String
    let upcoming: Bool
    let cores: [Core]
    let id: String
}

// MARK: - Core
struct Core {
    let core: String
    let flight: Int
    let gridfins, legs, reused, landingAttempt: Bool
    let landingSuccess: Bool
    let landingType, landpad: String
}

// MARK: - Links
struct Links {
    let patch: Patch
    let reddit: Reddit
    let flickr: Flickr
    let presskit: String
    let webcast: String
    let youtubeID: String
    let article, wikipedia: String
}

// MARK: - Flickr
struct Flickr {
    let small: [Any?]
    let original: [String]
}

// MARK: - Patch
struct Patch {
    let small, large: String
}

// MARK: - Reddit
struct Reddit {
    let campaign, launch, media: String
    let recovery: NSNull
}
