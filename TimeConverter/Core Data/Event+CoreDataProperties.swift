//
//  Event+CoreDataProperties.swift
//  TimeConverter
//
//  Created by Yvette Zhukovsky on 11/14/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//
//

import Foundation
import CoreData


extension Event {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Event> {
        return NSFetchRequest<Event>(entityName: "Event")
    }

    @NSManaged public var course: String
    @NSManaged public var stroke: String?
    @NSManaged public var distance: Int16
    @NSManaged public var timeEntered: String?
    @NSManaged public var timeConverted: String?
    @NSManaged public var date: Date?

}
