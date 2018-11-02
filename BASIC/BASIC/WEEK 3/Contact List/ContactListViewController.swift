//
//  ContactListViewController.swift
//  BASIC
//
//  Created by Je Min Son on 2018. 10. 31..
//  Copyright © 2018년 Je Min Son. All rights reserved.
//

import UIKit

class ContactListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, DetailInfo {
    

    
    @IBOutlet weak var contactListTableView: UITableView!
    
    var contactInfoArray: Array<ContactInfo> = []

    
    func saveContactInfo(object: ContactInfo, editContactInfo: Bool) {
        if editContactInfo {
            contactListTableView.reloadData()
            
        } else {
            contactInfoArray.append(object)
            contactListTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactInfoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactListTableViewCell") as! ContactListTableViewCell
        
        let obj = contactInfoArray[indexPath.row]
        cell.firstNameLabel.text = obj.firstName
        cell.lastNameLabel.text = obj.lastName
        cell.zipCodeLabel.text = String(obj.zipCode!)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alertController = UIAlertController(title: "Edit", message: "", preferredStyle: .alert)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .default) { action in
            print("delete \(indexPath.row)")
        }
        let editAction = UIAlertAction(title: "Edit", style: .default) { action in
            let obj = self.contactInfoArray[indexPath.row]
            
            if let controller = self.storyboard?.instantiateViewController(withIdentifier: "ContactInfoViewController") as? ContactInfoViewController {
                
                controller.contact = obj
                controller.delegate = self
                controller.isEdit = true

                self.navigationController?.pushViewController(controller, animated: true)
            }
        }
        
        alertController.addAction(deleteAction)
        alertController.addAction(editAction)
        
        present(alertController, animated: true, completion: nil)
        

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Contact List"
       
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(buttonAction))
        
        
    }
    
    @objc func buttonAction(_ sender: UIBarButtonItem) {
        
        if let controller = storyboard?.instantiateViewController(withIdentifier: "ContactInfoViewController") as? ContactInfoViewController {
            controller.delegate = self
            navigationController?.pushViewController(controller, animated: true)
        }
        
    }
    

    
}