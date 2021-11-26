//
//  Launchpad.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 01/11/2021.
//

import UIKit

struct Launchpad: Decodable {
    let name: String
    let locality: String
    let region: String
    let latitude: Double
    let longitude: Double
    let launchAttempts: Int
    let launchSuccesses: Int
    let successRate: String
    let status: String
    let details: String

    static let capeCanaveral40 = Launchpad(
        name: "CCSFS SLC 40", locality: "Cape Canaveral", region: "Florida, United States",
        latitude: 28.5618571, longitude: -80.577366, launchAttempts: 75, launchSuccesses: 73,
        successRate: "97%", status: "Active", details: """
        SpaceX's primary Falcon 9 pad, where all east coast Falcon 9s launched prior to the AMOS-6 anomaly. \
        Previously used alongside SLC-41 to launch Titan rockets for the US Air Force, the pad was heavily damaged \
        by the AMOS-6 anomaly in September 2016. It returned to flight with CRS-13 on December 15, 2017, \
        boasting an upgraded throwback-style Transporter-Erector modelled after that at LC-39A.
        """
    )

    static let vandenbergSFB = Launchpad(
        name: "VAFB SLC 4E", locality: "Vandenberg SF-Base", region: "California, United States",
        latitude: 34.632093, longitude: -80.577366, launchAttempts: 17, launchSuccesses: 17,
        successRate: "100%", status: "Active", details: """
        SpaceX's primary west coast launch pad for polar orbits and sun-synchronous orbits, primarily used for \
        Iridium NEXT and scientific satellite launches. The pad was used for the debut of Falcon 9 v1.1 in \
        the rocket's first ever non-dragon mission, CASSIOPE, in September 2013. It is SpaceX's only remaining pad \
        with the old-style transporter/erector, which reclines prior to launch instead of using a throwback procedure.
        """
    )

    static let capeCanaveral = Launchpad(
        name: "KSC LC 39A", locality: "Cape Canaveral", region: "Florida, United States",
        latitude: 28.6080585, longitude: -80.6039558, launchAttempts: 38, launchSuccesses: 38,
        successRate: "100%", status: "Active", details: """
        NASA's historic pad that launched most of the Saturn V and Space Shuttle missions, including Apollo 11. \
        SpaceX initially leased solely for Falcon Heavy and Crew Dragon launches, but the company has also used it \
        for others as well following the damage to SLC-40 in the AMOS-6 explosion. After completing the necessary \
        modifications, the first launch SpaceX performed on the pad was CRS-10 in February 2017.
        """
    )

    static let omelekIsland = Launchpad(
        name: "Kwajalein Atoll", locality: "Omelek Island", region: "U.S. Marshall Islands",
        latitude: 9.0477206, longitude: 167.7431292, launchAttempts: 5, launchSuccesses: 2,
        successRate: "40%", status: "Retired", details: """
        SpaceX's original pad, where all of the Falcon 1 flights occurred (from 2006 to 2009). \
        It would have also been the launch site of the Falcon 1e and the Falcon 9, \
        but it was abandoned as SpaceX ended the Falcon 1 program and decided against upgrading \
        it to support Falcon 9, likely due to its remote location and ensuing logistics complexities.
        """
    )

    static let unknown = Launchpad(name: "", locality: "", region: "", latitude: 0.0, longitude: 0.0,
                                   launchAttempts: 0, launchSuccesses: 0, successRate: "", status: "", details: "")
}
