//
//  ClienteViewModel.swift
//  UserTeste
//
//  Created by André Haas on 07/04/21.
//

import Foundation

class ClientViewModel {
    var name: String!
    var phone: String!
    var email: String!
    var origin: String!

    public func getData()-> Self {
        self.name = "Jacson"
        self.phone = "(47) 98457-0617"
        self.email = "jacson_brustolin@yahoo.com"
        self.origin = "Agenda café"
        return self
    }
}
