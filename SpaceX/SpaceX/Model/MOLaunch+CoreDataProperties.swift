//
//  MOLaunch+CoreDataProperties.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 19/11/2021.
//
//

import CoreData

extension MOLaunch {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MOLaunch> {
        return NSFetchRequest<MOLaunch>(entityName: "MOLaunch")
    }

    @NSManaged public var dateLocal: String
    @NSManaged public var details: String?
    @NSManaged public var launchpad: String
    @NSManaged public var name: String
    @NSManaged public var rocket: String
    @NSManaged public var success: Bool
    @NSManaged public var upcoming: Bool
    @NSManaged public var original: [String]
    @NSManaged public var wikipedia: String?
    @NSManaged public var article: String?
    @NSManaged public var small: String?
}

extension MOLaunch: Identifiable {}
