// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let rocket = try? newJSONDecoder().decode(Rocket.self, from: jsonData)

import Foundation

// MARK: - Rocket
struct Rocket: Codable {
    let height, diameter: Diameter
    let mass: Mass
    let firstStage: FirstStage?
    let secondStage: SecondStage?
    let engines: Engines?
    let landingLegs: LandingLegs?
    let payloadWeights: [PayloadWeight]?
    let flickrImages: [String]?
    let name, type: String
    let active: Bool
    let stages, boosters, costPerLaunch, successRatePct: Int?
    let firstFlight, country, company: String?
    let wikipedia: String?
    let rocketDescription, id: String?

    enum CodingKeys: String, CodingKey {
        case height, diameter, mass
        case firstStage
        case secondStage
        case engines
        case landingLegs
        case payloadWeights
        case flickrImages
        case name, type, active, stages, boosters
        case costPerLaunch
        case successRatePct
        case firstFlight
        case country, company, wikipedia
        case rocketDescription
        case id
    }
}

// MARK: - Diameter
struct Diameter: Codable {
    let meters, feet: Double
}

// MARK: - Engines
struct Engines: Codable {
    let isp: ISP?
    let thrustSeaLevel, thrustVacuum: Thrust?
    let number: Int
    let type, version, layout: String
    let engineLossMax: Int?
    let propellant1, propellant2: String?
    let thrustToWeight: Double?

    enum CodingKeys: String, CodingKey {
        case isp
        case thrustSeaLevel
        case thrustVacuum
        case number, type, version, layout
        case engineLossMax
        case propellant1
        case propellant2
        case thrustToWeight
    }
}

// MARK: - ISP
struct ISP: Codable {
    let seaLevel, vacuum: Int?

    enum CodingKeys: String, CodingKey {
        case seaLevel
        case vacuum
    }
}

// MARK: - Thrust
struct Thrust: Codable {
    let kN, lbf: Int
}

// MARK: - FirstStage
struct FirstStage: Codable {
    let thrustSeaLevel, thrustVacuum: Thrust
    let reusable: Bool
    let engines, fuelAmountTons, burnTimeSec: Int?

    enum CodingKeys: String, CodingKey {
        case thrustSeaLevel
        case thrustVacuum
        case reusable, engines
        case fuelAmountTons
        case burnTimeSec
    }
}

// MARK: - LandingLegs
struct LandingLegs: Codable {
    let number: Int
    let material: String
}

// MARK: - Mass
struct Mass: Codable {
    let kg, lb: Int
}

// MARK: - PayloadWeight
struct PayloadWeight: Codable {
    let id, name: String
    let kg, lb: Int
}

// MARK: - SecondStage
struct SecondStage: Codable {
    let thrust: Thrust
    let payloads: Payloads
    let reusable: Bool
    let engines, fuelAmountTons, burnTimeSec: Int

    enum CodingKeys: String, CodingKey {
        case thrust, payloads, reusable, engines
        case fuelAmountTons
        case burnTimeSec
    }
}

// MARK: - Payloads
struct Payloads: Codable {
    let compositeFairing: CompositeFairing
    let option1: String

    enum CodingKeys: String, CodingKey {
        case compositeFairing
        case option1
    }
}

// MARK: - CompositeFairing
struct CompositeFairing: Codable {
    let height, diameter: Diameter
}
