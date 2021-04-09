//
//  InteresseCollectionViewCell.swift
//  UserTeste
//
//  Created by André Haas on 08/04/21.
//

import UIKit
import Tanjiro

class InteresseCollectionViewCell: UICollectionViewCell, DefaultViewProtocol {

    lazy var bg = UIImageView().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 12
    }
    lazy var bgView = UIView().with {
        $0.layer.cornerRadius = 6
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        initLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initSubView() {
        bgView.addSubview(bg)
        addSubview(bgView)
    }

    func initConstrant() {
        bgView.layout {
            $0.top.equalToSuperView()
            $0.right.equalToSuperView()
            $0.left.equalToSuperView()
            $0.bottom.equalToSuperView()
            $0.height.constraint(equalToConstant: 120)
            $0.width.constraint(equalToConstant: 120)
        }
        bg.layout {
            $0.top.equalToSuperView()
            $0.left.equalToSuperView()
            $0.right.equalToSuperView()
            $0.bottom.equalToSuperView()
        }
    }

    func setup(_ image: UIImage) {
        bg.image = image
        bg.layer.cornerRadius = 12
    }


}
