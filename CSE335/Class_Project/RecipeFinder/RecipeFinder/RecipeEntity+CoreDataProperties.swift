//
//  RecipeEntity+CoreDataProperties.swift
//  RecipeFinder
//
//  Created by Todd Wenker on 4/21/18.
//  Copyright © 2018 Todd Wenker. All rights reserved.
//
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
    @NSManaged public var thumbnail: String?

}
