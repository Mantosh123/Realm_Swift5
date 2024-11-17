//
//  ContactListViewController.swift
//  MyContacts
//
//  Created by Mantosh Kumar on 17/11/24.
//

import UIKit

class ContactListViewController: UIViewController {

    @IBOutlet weak var contactTableView: UITableView!
    
    var contactList: [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.title = "Contacts List"
    }
    
    @IBAction func addContactAction(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "ContactDetailViewController") as ContactDetailViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}


extension ContactListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = contactTableView.dequeueReusableCell(withIdentifier: "ContactCell") as! ContactCell
        //cell.updateCell(with: contactList[indexPath.row])
        
        return cell
    }
    
    
}
