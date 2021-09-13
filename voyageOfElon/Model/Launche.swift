// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let launch = try Launch(json)

import Foundation

// MARK: - LaunchElement
struct LaunchElement: Codable {
    let fairings: Fairings?
    let links: Links
    let staticFireDateUTC: String?
    let staticFireDateUnix: Int?
    let net: Bool
    let window: Int?
    let rocket: Rocket
    let success: Bool?
    let failures: [Failure]
    let details: String?
    let crew: [Crew]
    let ships, capsules, payloads: [String]
    let launchpad: Launchpad
    let flightNumber: Int
    let name, dateUTC: String
    let dateUnix: Int
    let dateLocal: Date
    let datePrecision: DatePrecision
    let upcoming: Bool
    let cores: [Core]
    let autoUpdate, tbd: Bool
    let launchLibraryID: String?
    let id: String

    enum CodingKeys: String, CodingKey {
        case fairings, links
        case staticFireDateUTC
        case staticFireDateUnix
        case net, window, rocket, success, failures, details, crew, ships, capsules, payloads, launchpad
        case flightNumber
        case name
        case dateUTC
        case dateUnix
        case dateLocal
        case datePrecision
        case upcoming, cores
        case autoUpdate
        case tbd
        case launchLibraryID
        case id
    }
}

// MARK: LaunchElement convenience initializers and mutators

extension LaunchElement {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(LaunchElement.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        fairings: Fairings?? = nil,
        links: Links? = nil,
        staticFireDateUTC: String?? = nil,
        staticFireDateUnix: Int?? = nil,
        net: Bool? = nil,
        window: Int?? = nil,
        rocket: Rocket? = nil,
        success: Bool?? = nil,
        failures: [Failure]? = nil,
        details: String?? = nil,
        crew: [Crew]? = nil,
        ships: [String]? = nil,
        capsules: [String]? = nil,
        payloads: [String]? = nil,
        launchpad: Launchpad? = nil,
        flightNumber: Int? = nil,
        name: String? = nil,
        dateUTC: String? = nil,
        dateUnix: Int? = nil,
        dateLocal: Date? = nil,
        datePrecision: DatePrecision? = nil,
        upcoming: Bool? = nil,
        cores: [Core]? = nil,
        autoUpdate: Bool? = nil,
        tbd: Bool? = nil,
        launchLibraryID: String?? = nil,
        id: String? = nil
    ) -> LaunchElement {
        return LaunchElement(
            fairings: fairings ?? self.fairings,
            links: links ?? self.links,
            staticFireDateUTC: staticFireDateUTC ?? self.staticFireDateUTC,
            staticFireDateUnix: staticFireDateUnix ?? self.staticFireDateUnix,
            net: net ?? self.net,
            window: window ?? self.window,
            rocket: rocket ?? self.rocket,
            success: success ?? self.success,
            failures: failures ?? self.failures,
            details: details ?? self.details,
            crew: crew ?? self.crew,
            ships: ships ?? self.ships,
            capsules: capsules ?? self.capsules,
            payloads: payloads ?? self.payloads,
            launchpad: launchpad ?? self.launchpad,
            flightNumber: flightNumber ?? self.flightNumber,
            name: name ?? self.name,
            dateUTC: dateUTC ?? self.dateUTC,
            dateUnix: dateUnix ?? self.dateUnix,
            dateLocal: dateLocal ?? self.dateLocal,
            datePrecision: datePrecision ?? self.datePrecision,
            upcoming: upcoming ?? self.upcoming,
            cores: cores ?? self.cores,
            autoUpdate: autoUpdate ?? self.autoUpdate,
            tbd: tbd ?? self.tbd,
            launchLibraryID: launchLibraryID ?? self.launchLibraryID,
            id: id ?? self.id
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Core
struct Core: Codable {
    let core: String?
    let flight: Int?
    let gridfins, legs, reused, landingAttempt: Bool?
    let landingSuccess: Bool?
    let landingType: LandingType?
    let landpad: Landpad?

    enum CodingKeys: String, CodingKey {
        case core, flight, gridfins, legs, reused
        case landingAttempt
        case landingSuccess
        case landingType
        case landpad
    }
}

// MARK: Core convenience initializers and mutators

extension Core {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Core.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        core: String?? = nil,
        flight: Int?? = nil,
        gridfins: Bool?? = nil,
        legs: Bool?? = nil,
        reused: Bool?? = nil,
        landingAttempt: Bool?? = nil,
        landingSuccess: Bool?? = nil,
        landingType: LandingType?? = nil,
        landpad: Landpad?? = nil
    ) -> Core {
        return Core(
            core: core ?? self.core,
            flight: flight ?? self.flight,
            gridfins: gridfins ?? self.gridfins,
            legs: legs ?? self.legs,
            reused: reused ?? self.reused,
            landingAttempt: landingAttempt ?? self.landingAttempt,
            landingSuccess: landingSuccess ?? self.landingSuccess,
            landingType: landingType ?? self.landingType,
            landpad: landpad ?? self.landpad
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum LandingType: String, Codable {
    case asds = "ASDS"
    case ocean = "Ocean"
    case rtls = "RTLS"
}

enum Landpad: String, Codable {
    case the5E9E3032383Ecb267A34E7C7 = "5e9e3032383ecb267a34e7c7"
    case the5E9E3032383Ecb554034E7C9 = "5e9e3032383ecb554034e7c9"
    case the5E9E3032383Ecb6Bb234E7CA = "5e9e3032383ecb6bb234e7ca"
    case the5E9E3032383Ecb761634E7Cb = "5e9e3032383ecb761634e7cb"
    case the5E9E3032383Ecb90A834E7C8 = "5e9e3032383ecb90a834e7c8"
    case the5E9E3033383Ecb075134E7CD = "5e9e3033383ecb075134e7cd"
    case the5E9E3033383Ecbb9E534E7Cc = "5e9e3033383ecbb9e534e7cc"
}

// MARK: - Crew
struct Crew: Codable {
    let crew, role: String
}

// MARK: Crew convenience initializers and mutators

extension Crew {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Crew.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        crew: String? = nil,
        role: String? = nil
    ) -> Crew {
        return Crew(
            crew: crew ?? self.crew,
            role: role ?? self.role
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum DatePrecision: String, Codable {
    case day = "day"
    case hour = "hour"
    case month = "month"
    case quarter = "quarter"
}

// MARK: - Failure
struct Failure: Codable {
    let time: Int
    let altitude: Int?
    let reason: String
}

// MARK: Failure convenience initializers and mutators

extension Failure {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Failure.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        time: Int? = nil,
        altitude: Int?? = nil,
        reason: String? = nil
    ) -> Failure {
        return Failure(
            time: time ?? self.time,
            altitude: altitude ?? self.altitude,
            reason: reason ?? self.reason
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Fairings
struct Fairings: Codable {
    let reused, recoveryAttempt, recovered: Bool?
    let ships: [Ship]

    enum CodingKeys: String, CodingKey {
        case reused
        case recoveryAttempt
        case recovered, ships
    }
}

// MARK: Fairings convenience initializers and mutators

extension Fairings {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Fairings.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        reused: Bool?? = nil,
        recoveryAttempt: Bool?? = nil,
        recovered: Bool?? = nil,
        ships: [Ship]? = nil
    ) -> Fairings {
        return Fairings(
            reused: reused ?? self.reused,
            recoveryAttempt: recoveryAttempt ?? self.recoveryAttempt,
            recovered: recovered ?? self.recovered,
            ships: ships ?? self.ships
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum Ship: String, Codable {
    case the5Ea6Ed2E080Df4000697C907 = "5ea6ed2e080df4000697c907"
    case the5Ea6Ed2E080Df4000697C908 = "5ea6ed2e080df4000697c908"
    case the5Ea6Ed2E080Df4000697C909 = "5ea6ed2e080df4000697c909"
    case the5Ea6Ed2F080Df4000697C90B = "5ea6ed2f080df4000697c90b"
    case the5Ea6Ed2F080Df4000697C90C = "5ea6ed2f080df4000697c90c"
    case the5Ea6Ed2F080Df4000697C90D = "5ea6ed2f080df4000697c90d"
    case the6059166413F40E27E8Af34B6 = "6059166413f40e27e8af34b6"
    case the60C8C7A45D4819007Ea69871 = "60c8c7a45d4819007ea69871"
}

enum Launchpad: String, Codable {
    case the5E9E4501F509094Ba4566F84 = "5e9e4501f509094ba4566f84"
    case the5E9E4502F509092B78566F87 = "5e9e4502f509092b78566f87"
    case the5E9E4502F509094188566F88 = "5e9e4502f509094188566f88"
    case the5E9E4502F5090995De566F86 = "5e9e4502f5090995de566f86"
}

// MARK: - Links
struct Links: Codable {
    let patch: Patch
    let reddit: Reddit
    let flickr: Flickr
    let presskit: String?
    let webcast: String?
    let youtubeID: String?
    let article: String?
    let wikipedia: String?

    enum CodingKeys: String, CodingKey {
        case patch, reddit, flickr, presskit, webcast
        case youtubeID
        case article, wikipedia
    }
}

// MARK: Links convenience initializers and mutators

extension Links {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Links.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        patch: Patch? = nil,
        reddit: Reddit? = nil,
        flickr: Flickr? = nil,
        presskit: String?? = nil,
        webcast: String?? = nil,
        youtubeID: String?? = nil,
        article: String?? = nil,
        wikipedia: String?? = nil
    ) -> Links {
        return Links(
            patch: patch ?? self.patch,
            reddit: reddit ?? self.reddit,
            flickr: flickr ?? self.flickr,
            presskit: presskit ?? self.presskit,
            webcast: webcast ?? self.webcast,
            youtubeID: youtubeID ?? self.youtubeID,
            article: article ?? self.article,
            wikipedia: wikipedia ?? self.wikipedia
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Flickr
struct Flickr: Codable {
    let small: [JSONAny]
    let original: [String]
}

// MARK: Flickr convenience initializers and mutators

extension Flickr {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Flickr.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        small: [JSONAny]? = nil,
        original: [String]? = nil
    ) -> Flickr {
        return Flickr(
            small: small ?? self.small,
            original: original ?? self.original
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Patch
struct Patch: Codable {
    let small, large: String?
}

// MARK: Patch convenience initializers and mutators

extension Patch {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Patch.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        small: String?? = nil,
        large: String?? = nil
    ) -> Patch {
        return Patch(
            small: small ?? self.small,
            large: large ?? self.large
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Reddit
struct Reddit: Codable {
    let campaign: String?
    let launch: String?
    let media, recovery: String?
}

// MARK: Reddit convenience initializers and mutators

extension Reddit {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Reddit.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        campaign: String?? = nil,
        launch: String?? = nil,
        media: String?? = nil,
        recovery: String?? = nil
    ) -> Reddit {
        return Reddit(
            campaign: campaign ?? self.campaign,
            launch: launch ?? self.launch,
            media: media ?? self.media,
            recovery: recovery ?? self.recovery
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum Rocket: String, Codable {
    case the5E9D0D95Eda69955F709D1Eb = "5e9d0d95eda69955f709d1eb"
    case the5E9D0D95Eda69973A809D1Ec = "5e9d0d95eda69973a809d1ec"
    case the5E9D0D95Eda69974Db09D1Ed = "5e9d0d95eda69974db09d1ed"
}

typealias Launch = [LaunchElement]

extension Array where Element == Launch.Element {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Launch.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
