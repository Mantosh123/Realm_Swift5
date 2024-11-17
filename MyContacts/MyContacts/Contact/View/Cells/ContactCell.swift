//
//  ContactCell.swift
//  MyContacts
//
//  Created by Mantosh Kumar on 17/11/24.
//

import UIKit

class ContactCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var phoneNoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateCell(with contact: Contact) {
        nameLabel?.text = contact.firstName
        phoneNoLabel?.text = contact.contactNumber
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
