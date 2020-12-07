//
//  Task+CoreDataProperties.swift
//  myTasks
//
//  Created by Benjamin Benoit on 07/12/2020.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var title: String?
    @NSManaged public var uuid: UUID?

}

extension Task : Identifiable {

}
