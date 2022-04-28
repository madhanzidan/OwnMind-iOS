//
//  Mindfulness+CoreDataProperties.swift
//  OwnMind
//
//  Created by Zidan Ramadhan on 28/04/22.
//
//

import Foundation
import CoreData


extension Mindfulness {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Mindfulness> {
        return NSFetchRequest<Mindfulness>(entityName: "Mindfulness")
    }

    @NSManaged public var sessionsDone: Int64

}

extension Mindfulness : Identifiable {

}
