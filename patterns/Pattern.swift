//
//  Pattern.swift
//  patterns
//
//  Created by Merritte on 2/20/15.
//  Copyright (c) 2015 Merritte. All rights reserved.
//

import Foundation
import CoreData

class Pattern: NSManagedObject {

    @NSManaged var backImage: NSData
    @NSManaged var frontImage: NSData
    @NSManaged var name: String

}
