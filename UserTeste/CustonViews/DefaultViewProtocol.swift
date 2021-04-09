//
//  DefaultViewProtocol.swift
//  UserTeste
//
//  Created by André Haas on 07/04/21.
//

import Foundation

protocol DefaultViewProtocol {
    func initLayout()
    func initSubView()
    func initConstrant()
}

extension DefaultViewProtocol {
    func initLayout() {
        initSubView()
        initConstrant()

    }

    func initSubView() {}
    func initConstrant(){}
}
