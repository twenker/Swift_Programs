//
//  RecipeEntity+CoreDataProperties.swift
//  
//
//  Created by Todd Wenker on 4/21/18.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension RecipeEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RecipeEntity> {
        return NSFetchRequest<RecipeEntity>(entityName: "RecipeEntity")
    }

    @NSManaged public var href: String?
    @NSManaged public var ingredients: String?
    @NSManaged public var title: String?

}
