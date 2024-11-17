//
//  ContactListViewController.swift
//  MyContacts
//
//  Created by Mantosh Kumar on 17/11/24.
//

import UIKit
import RealmSwift

class ContactListViewController: UIViewController {

    @IBOutlet weak var noDataLabel: UILabel!
    @IBOutlet weak var contactTableView: UITableView!
    
    let realmWrapper = RealmWrapper()
    var contactList: [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.title = "Contacts List"
        noDataLabel.isHidden = false
        setStatusBarBGColor()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        readContactfromDB()
    }
    
    private func setStatusBarBGColor () {
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        // https://stackoverflow.com/a/57899013/7316675
        let statusBar = UIView(frame: window?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero)
        statusBar.backgroundColor = .systemCyan
        window?.addSubview(statusBar)
        navigationController?.navigationBar.backgroundColor = .systemCyan
    }

    
    func readContactfromDB() {
        
        var allData = realmWrapper.getObjects(objc: Contact.self)
        print("All Data :- \(String(describing: allData))")
        
        contactList = [Contact]()
        noDataLabel.isHidden = (contactList.count == 0) ?? false
        
        if (allData?.count == 0) {
            noDataLabel.isHidden = false
            contactTableView.isHidden = true
        } else {
            contactTableView.isHidden = false
            noDataLabel.isHidden = true
        }
        
        if let objects = allData {
            for data in objects {
                if let contact = data as? Contact {
                    contactList.append(contact)
                }
            }
        }
        contactTableView.reloadData()
    }
    
    @IBAction func addContactAction(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "ContactDetailViewController") as ContactDetailViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}


extension ContactListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contactTableView.dequeueReusableCell(withIdentifier: "ContactCell") as! ContactCell
        cell.updateCell(with: contactList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact = contactList[indexPath.row]
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "ContactDetailViewController") as ContactDetailViewController
        vc.contact = contact
        navigationController?.pushViewController(vc, animated: true)
    }
}
