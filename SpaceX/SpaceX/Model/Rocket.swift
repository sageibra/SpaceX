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
    let status: String
    let successRatePct: String
    let firstFlight: String
    let wikipedia: String
    let overview: String

    static let falcon1 = Rocket(
        height: "22.2 m", mass: "30146 kg", image: Images.falcon1,
        name: "Falcon 1", status: "Retired", successRatePct: "40%",
        firstFlight: "4 Mar 2006", wikipedia: "https://en.wikipedia.org/wiki/Falcon_1",
        overview: """
        The Falcon 1 was an expendable launch system privately developed and manufactured \
        by SpaceX during 2006–2009. On 28 September 2008, Falcon 1 became the first \
        privately-developed fully liquid-fueled launch vehicle to go into orbit around the Earth.
        """
    )

    static let falcon9 = Rocket(
        height: "70.0 m", mass: "549054 kg", image: Images.falcon9,
        name: "Falcon 9", status: "Active", successRatePct: "98%",
        firstFlight: "4 Jun 2010", wikipedia: "https://en.wikipedia.org/wiki/Falcon_9",
        overview: """
        Falcon 9 is a partially reusable two-stage-to-orbit medium-lift launch vehicle designed and \
        manufactured by SpaceX in the United States. The latest version of the first stage can \
        return to Earth and be flown again multiple times.
        """
    )

    static let falconHeavy = Rocket(
        height: "118 m", mass: "1335000 kg", image: Images.falconHeavy,
        name: "Falcon Heavy", status: "Active", successRatePct: "100%",
        firstFlight: "6 Feb 2018", wikipedia: "https://en.wikipedia.org/wiki/Falcon_Heavy",
        overview: """
        Falcon Heavy is a partially reusable heavy-lift launch vehicle designed and \
        manufactured by SpaceX. It is derived from the Falcon 9 vehicle and consists of a \
        strengthened Falcon 9 first stage as the center core with two additional \
        Falcon 9-like first stages as strap-on boosters.
        """
    )

    static let unknown = Rocket(height: "", mass: "", image: UIImage(), name: "", status: "",
                                successRatePct: "", firstFlight: "", wikipedia: "", overview: "")
}
