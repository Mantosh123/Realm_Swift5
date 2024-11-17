//
//  ContactDetailViewController.swift
//  MyContacts
//
//  Created by Mantosh Kumar on 17/11/24.
//

import UIKit

class ContactDetailViewController: UIViewController {
    
    @IBOutlet weak var fNameTextField: UITextField!
    @IBOutlet weak var lNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    var contact = Contact()
    private let realmWrapper = RealmWrapper()
//    weak var delegate: ContactListViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Edit Contact"
        updateDetailsView()
    }
    
    func updateDetailsView() {
        fNameTextField.text = contact.firstName
        lNameTextField.text = contact.lastName
        phoneNumberTextField.text = contact.contactNumber
    }
    
    @IBAction func updateContactAction(_ sender: Any) {
        
        let id = contact.id
        let fname = fNameTextField.text ?? "No fName"
        let lname = lNameTextField.text ?? "No sName"
        let phoneNo = phoneNumberTextField.text ?? "No Phone"
        
        let editedContact = Contact(id: id, firstName: fname, lastName: lname, contactNumber: phoneNo)
        realmWrapper.updateObjects(objs: editedContact)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteContact(_ sender: Any) {
        realmWrapper.deleteObject(objs: contact)
        navigationController?.popViewController(animated: true)
    }
}
