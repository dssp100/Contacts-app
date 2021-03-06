//
//  ContactsTableViewConroller.swift
//  Contacts
//
//  Created by Daniel Springer on 30/12/2016.
//  Copyright © 2016 Daniel Springer. All rights reserved.
//

import UIKit


class ContactsTableViewController: UITableViewController {
    
        var contacts:[Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(ContactsTableViewController.addContact))
        navigationItem.rightBarButtonItem = addButton
        
        
       self.navigationItem.leftBarButtonItem = self.editButtonItem;
        
        func toggleEdit() {
            tableView.setEditing(!tableView.isEditing, animated: true)
        }
        
        let jenny = Contact(phoneNumber: "867 - 5309")
        let rich = Contact(name: "Rich", phoneNumber: "888-888-8888")
        let mindy = Contact(name: "Mindy")
        
        self.contacts.append(jenny)
        self.contacts.append(rich)
        self.contacts.append(mindy)
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return self.contacts.count
    }
    
    
    
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
            let contact = self.contacts[indexPath.row]
            
            if let name = contact.name {
                cell.textLabel?.text = name
            } else {
                cell.textLabel?.text = "No Name"
            }
            
            return cell
        }    
    
    
     // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.contacts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    

     // Override to support rearranging the table view.
override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
    let contactMoving = contacts.remove(at: fromIndexPath.row)
    contacts.insert(contactMoving, at: to.row)
}


    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    

     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = self.tableView.indexPath(for: sender as! UITableViewCell)!
        let contact = self.contacts[indexPath.row]
        let destination = segue.destination as! DetailViewController
        destination.contact = contact
     }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func addContact() {
        let newContact = Contact(name: "New Contact")
        self.contacts.append(newContact)
        let newIndexPath = IndexPath(row: self.contacts.count - 1, section: 0)
        self.tableView.insertRows(at: [newIndexPath], with: .automatic)
    }
}

