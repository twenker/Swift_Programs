//
//  CityEntity+CoreDataProperties.swift
//  Todd_Wenker_Lab4
//
//  Created by Todd Wenker on 2/26/18.
//  Copyright © 2018 Todd Wenker. All rights reserved.
//
//

import Foundation
import CoreData


extension CityEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CityEntity> {
        return NSFetchRequest<CityEntity>(entityName: "CityEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var details: String?
    @NSManaged public var picture: NSData?

}
