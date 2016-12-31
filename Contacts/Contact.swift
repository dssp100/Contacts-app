//
//  Contact.swift
//  Contacts
//
//  Created by Daniel Springer on 31/12/2016.
//  Copyright © 2016 Daniel Springer. All rights reserved.
//

import UIKit

class Contact: NSObject {
    var name: String?
    var phoneNumber: String?
    
    init(name: String? = nil, phoneNumber: String? = nil){
        self.name = name
        self.phoneNumber = phoneNumber
        super.init()
    }
}
