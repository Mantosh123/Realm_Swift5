//
//  ContactCell.swift
//  MyContacts
//
//  Created by Mantosh Kumar on 17/11/24.
//

import UIKit

class ContactCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateCell(with contact: Contact) {
        textLabel?.text = contact.firstName
        detailTextLabel?.text = contact.lastName
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
