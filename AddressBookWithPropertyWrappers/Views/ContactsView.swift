//
//  ContactsView.swift
//  AddressBookWithPropertyWrappers
//
//  Created by Ben Stone on 3/3/21.
//

import SwiftUI

struct ContactsView: View {
    @EnvironmentObject var viewModel: AddressBookViewModel
 
    var body: some View {
        ForEach(0..<viewModel.contactCount) { index in // 1 - Use the number of contacts from the view model
            HStack {
                // 2 Add contact
                let contact = viewModel.contact(atIndex: index)
                VStack {
                    // 3 - Add the contact’s name and postal code
                    Text(contact.name)
                    Text(contact.displayPostalCode)
                        .font(.caption2)
                }
                Button(action: {
                    // 4 - Call the appropriate view model method
                    viewModel.toggleFavorite(atIndex: index)
                }) {
                    // 5 - Update the star to be filled when the contact is a favorite
                    contact.isFavorite ? Image(systemName: "star.fill") : Image(systemName: "star")
                }
            }
            .padding()
            .border(Color.black, width: 1)
        }
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView() // TODO: ENVIRONMENTOBJECT - Add the view model to the preview
            .environmentObject(AddressBookViewModel())
    }
}
