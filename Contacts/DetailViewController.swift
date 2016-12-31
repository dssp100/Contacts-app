//
//  DetailViewController.swift
//  Contacts
//
//  Created by Daniel Springer on 31/12/2016.
//  Copyright © 2016 Daniel Springer. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var phoneNumberLabel: UILabel!
    var contact: Contact?
    


override func viewDidLoad() {
    super.viewDidLoad()
    
    if let contact = self.contact {
        if let name = contact.name {
            self.nameLabel.text = name
        }
        if let phoneNumber = contact.phoneNumber {
            self.phoneNumberLabel.text = phoneNumber
        }
    }
}
}
