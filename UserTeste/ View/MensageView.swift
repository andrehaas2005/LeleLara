//
//  MensageView.swift
//  UserTeste
//
//  Created by André Haas on 09/04/21.
//

import UIKit
import Tanjiro

class MensageView: UIView, DefaultViewProtocol {

    let listMesage = ["Olá gostaria de um tour virtual, me ligue (xx) XXXX - XXXX falar com que atender...",
                      "Olá gostaria de um tour virtual, me ligue (xx) XXXX - XXXX falar com que atender...",
                      "Olá gostaria de um tour virtual, me ligue (xx) XXXX - XXXX falar com que atender...",
                      "Olá gostaria de um tour virtual, me ligue (xx) XXXX - XXXX falar com que atender...",
                      "Olá gostaria de um tour virtual, me ligue (xx) XXXX - XXXX falar com que atender..."]

    lazy var content = UIView()

    lazy var titleLabel = UILabel().with {
        $0.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        $0.lineBreakMode = .byWordWrapping
        $0.numberOfLines = 0
        $0.textColor = .systemGray2
        $0.text = "Mensagem"
        $0.textAlignment = .center
    }

    lazy var tableMessage = UITableView().with {
        $0.delegate = self
        $0.dataSource = self
    }
    override init(frame: CGRect) {
        super.init(frame: .zero)
        initLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initSubView() {
        content.addSubview(titleLabel)
        content.addSubview(tableMessage)
        addSubview(content)
    }

    func initConstrant() {
        content.layout {
            $0.top.equalToSuperView()
            $0.left.equalToSuperView()
            $0.right.equalToSuperView()
            $0.bottom.equalToSuperView()
        }

        titleLabel.layout {
            $0.top.equalToSuperView()
            $0.left.equalToSuperView()
            $0.right.equalToSuperView()

        }

        tableMessage.layout {
            $0.top.equal(to: titleLabel.bottomAnchor, offsetBy: 16)
            $0.left.equalToSuperView()
            $0.right.equalToSuperView()
            $0.bottom.equalToSuperView(-16)

        }
    }
}


extension MensageView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listMesage.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = listMesage[indexPath.row]
        cell.detailTextLabel?.text = " \(indexPath.row+1)/\(listMesage.count)"
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.numberOfLines = 0
        return cell
    }
}
