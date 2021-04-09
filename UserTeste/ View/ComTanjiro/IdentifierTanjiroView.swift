//
//  IdentifierTanjiroView.swift
//  UserTeste
//
//  Created by André Haas on 09/04/21.
//

import UIKit
import Tanjiro


class IdentifierTanjiroView: UIView, DefaultViewProtocol {

    // pode colocar
    lazy var content = UIView()
    lazy var photoImagemView = UIImageView()

    lazy var nameLabel = UILabel().with { label in
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.medium)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .center
    }

    lazy var phoneLabel = UILabel().with { label in
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .center
    }
    lazy var emailLabel = UILabel().with {
        $0.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        $0.lineBreakMode = .byWordWrapping
        $0.numberOfLines = 0
        $0.textColor = .black
        $0.textAlignment = .center
    }
    lazy var originLabel = UILabel().with {
        $0.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        $0.lineBreakMode = .byWordWrapping
        $0.numberOfLines = 0
        $0.textColor = .black
        $0.textAlignment = .center
    }
    lazy var originTitleLabel = UILabel().with {
        $0.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        $0.lineBreakMode = .byWordWrapping
        $0.numberOfLines = 0
        $0.textColor = .systemGray2
        $0.text = "Origem"
        $0.textAlignment = .center

    }

    init() {
        super.init(frame: .zero)
        initLayout()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initSubView() {
        content.addSubview(photoImagemView)
        content.addSubview(nameLabel)
        content.addSubview(phoneLabel)
        content.addSubview(emailLabel)
        content.addSubview(originTitleLabel)
        content.addSubview(originLabel)

        self.addSubview(content)
    }

    func initConstrant() {
        content.layout {
            $0.top.equalToSuperView()
            $0.left.equalToSuperView()
            $0.right.equalToSuperView()
            $0.bottom.equalToSuperView()
        }

        photoImagemView.layout {
            $0.top.equalToSuperView(24)
            $0.height.constraint(equalToConstant: 100)
            $0.width.constraint(equalToConstant: 100)
            $0.centerX.equalToSuperView()
        }
        nameLabel.layout {
            $0.top.equal(to: photoImagemView.bottomAnchor, offsetBy: 24)
            $0.left.equalToSuperView()
            $0.right.equalToSuperView()
        }
        phoneLabel.layout {
            $0.top.equal(to: nameLabel.bottomAnchor, offsetBy: 16)
            $0.left.equalToSuperView()
            $0.right.equalToSuperView()
        }
        emailLabel.layout {
            $0.top.equal(to: phoneLabel.bottomAnchor, offsetBy: 16)
            $0.left.equalToSuperView()
            $0.right.equalToSuperView()
        }
        originTitleLabel.layout {
            $0.top.equal(to: emailLabel.bottomAnchor, offsetBy: 24)
            $0.left.equalToSuperView()
            $0.right.equalToSuperView()
        }
        originLabel.layout {
            $0.top.equal(to: originTitleLabel.bottomAnchor, offsetBy: 24)
            $0.left.equalToSuperView()
            $0.right.equalToSuperView()
            $0.bottom.equalToSuperView(-16)
        }
    }



    func setup(_ clientViewModel: ClientViewModel) {

        photoImagemView.image = UIImage(named: "img_user_sem_foto")
        photoImagemView.contentMode = .scaleAspectFill

        nameLabel.text = clientViewModel.name
        phoneLabel.text = clientViewModel.phone
        emailLabel.text = clientViewModel.email
        originLabel.text = clientViewModel.origin
        layoutIfNeeded()

    }
}

