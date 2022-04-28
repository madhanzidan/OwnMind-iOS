//
//  Journal+CoreDataProperties.swift
//  OwnMind
//
//  Created by Zidan Ramadhan on 28/04/22.
//
//

import Foundation
import CoreData


extension Journal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Journal> {
        return NSFetchRequest<Journal>(entityName: "Journal")
    }

    @NSManaged public var date: String?
    @NSManaged public var different: String?
    @NSManaged public var feel: String?
    @NSManaged public var happened: String?
    @NSManaged public var newThoughts: String?
    @NSManaged public var thoughts: String?
    @NSManaged public var trigger: String?

}

extension Journal : Identifiable {

}
