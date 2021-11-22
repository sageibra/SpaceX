//
//  DataBaseService.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 19/11/2021.
//
//

import UIKit
import CoreData

protocol DataBaseServiceProtocol {
    func update(launches: [Launch])
    func launches() -> [Launch]
}

final class DataBaseService {
    let coreDataStack: CoreDataStack

    init(coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack
    }
}

extension DataBaseService: DataBaseServiceProtocol {

    func update(launches: [Launch]) {
        deleteAll()
        let context = coreDataStack.backgroundContext
        context.performAndWait {
            launches.forEach {
                let launch = MOLaunch(context: context)
                launch.name = $0.name
                launch.dateLocal = $0.dateLocal
                launch.details = $0.details ?? ""
                launch.rocket = $0.rocket
                launch.launchpad = $0.launchpad
                launch.upcoming = $0.upcoming
                launch.success = $0.success ?? false
                launch.small = $0.links.patch.small ?? nil
                launch.wikipedia = $0.links.wikipedia ?? nil
                launch.article = $0.links.article ?? nil
                launch.original = $0.links.flickr.original
            }
            try? context.save()
        }
    }

    func launches() -> [Launch] {
        let context = coreDataStack.mainContext
        var result = [Launch]()

        let request = NSFetchRequest<MOLaunch>(entityName: "MOLaunch")
        context.performAndWait {
            guard let launches = try? request.execute() else { return }
            result = launches.map { Launch(with: $0) }
        }
        print(result.count)
        return result
    }

    func deleteAll() {
        let fetchRequest = NSFetchRequest<MOLaunch>(entityName: "MOLaunch")
        coreDataStack.backgroundContext.performAndWait {
            let movies = try? fetchRequest.execute()
            movies?.forEach {
                coreDataStack.backgroundContext.delete($0)
            }

            try? coreDataStack.backgroundContext.save()
        }
    }
}

private extension DataBaseService {
    private func fetchRequest(for dto: Launch) -> NSFetchRequest<MOLaunch> {
        let request = NSFetchRequest<MOLaunch>(entityName: "MOLaunch")
        return request
    }
}

private extension Launch {
    init(with moLaunch: MOLaunch) {
        self.details = moLaunch.details ?? ""
        self.rocket = moLaunch.rocket
        self.name = moLaunch.name
        self.dateLocal = moLaunch.dateLocal
        self.launchpad = moLaunch.launchpad
        self.success = moLaunch.success
        self.upcoming = moLaunch.upcoming
        self.links = Links(patch: Patch(small: moLaunch.small),
                           flickr: Flickr(original: moLaunch.original),
                           article: moLaunch.article,
                           wikipedia: moLaunch.wikipedia)
    }
}
