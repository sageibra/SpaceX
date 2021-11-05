//
//  Rocket.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 28/10/2021.
//

import UIKit

// MARK: - Rocket
struct Rocket {
    let height: String
    let mass: String
    let image: UIImage
    let name: String
    let active: String
    let stages: Int
    let successRatePct: String
    let firstFlight: String
    let country: String
    let company: String
    let wikipedia: String
    let rocketDescription: String

    static let falcon1 = Rocket(
        height: "22.2 m", mass: "30146 kg", image: Images.falcon1,
        name: "Falcon 1", active: "No", stages: 2, successRatePct: "40 %",
        firstFlight: "2006-03-24", country: "Republic of the Marshall Islands", company: "SpaceX",
        wikipedia: "https://en.wikipedia.org/wiki/Falcon_1",
        rocketDescription: """
        The Falcon 1 was an expendable launch system privately developed and manufactured
        by SpaceX during 2006–2009. On 28 September 2008, Falcon 1 became the first
        privately-developed fully liquid-fueled launch vehicle to go into orbit around the Earth.
        """
    )

    static let falcon9 = Rocket(
        height: "70.0 m", mass: "549054 kg", image: Images.falcon9,
        name: "Falcon 9", active: "Yes", stages: 2, successRatePct: "98 %",
        firstFlight: "2010-06-04", country: "United States", company: "SpaceX",
        wikipedia: "https://en.wikipedia.org/wiki/Falcon_9",
        rocketDescription: """
        Falcon 9 is a partially reusable two-stage-to-orbit medium-lift launch vehicle designed and
        manufactured by SpaceX in the United States. The latest version of the first stage can
        return to Earth and be flown again multiple times.
        """
    )

    static let falconHeavy = Rocket(
        height: "118 m", mass: "1335000 kg", image: Images.falconHeavy,
        name: "Falcon Heavy", active: "Yes", stages: 2, successRatePct: "100 %",
        firstFlight: "2018-02-06", country: "United States", company: "SpaceX",
        wikipedia: "https://en.wikipedia.org/wiki/Falcon_Heavy",
        rocketDescription: """
        Falcon Heavy is a partially reusable heavy-lift launch vehicle designed and
        manufactured by SpaceX. It is derived from the Falcon 9 vehicle and consists of a
        strengthened Falcon 9 first stage as the center core with two additional
        Falcon 9-like first stages as strap-on boosters.[8]
        """
    )

    static let unknown = Rocket(height: "", mass: "", image: UIImage(), name: "", active: "",
        stages: 0, successRatePct: "", firstFlight: "", country: "", company: "", wikipedia: "", rocketDescription: "")
}
