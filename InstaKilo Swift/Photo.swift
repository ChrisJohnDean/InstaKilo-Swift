//
//  Photo.swift
//  InstaKilo Swift
//
//  Created by Chris Dean on 2018-03-06.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

import Foundation
import UIKit

class Photo {
    
    var myPhoto: UIImage
    var subject: String
    var location: String
    
    init(myPhoto: UIImage, subject: String, location: String) {
        self.myPhoto = myPhoto
        self.subject = subject
        self.location = location
    }

}
