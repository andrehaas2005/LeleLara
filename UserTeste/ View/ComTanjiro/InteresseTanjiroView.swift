//
//  InteresseTanjiroView.swift
//  UserTeste
//
//  Created by André Haas on 09/04/21.
//

import UIKit
import Tanjiro

class InteresseTanjiroView: UIView, DefaultViewProtocol {

    let listCasas = [UIImage(named: "casa1"),
                     UIImage(named: "casa2"),
                     UIImage(named: "casa3"),
                     UIImage(named: "casa4")]

    lazy var content = UIView()
    lazy var labelTitle = UILabel().with {
        $0.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        $0.lineBreakMode = .byWordWrapping
        $0.numberOfLines = 0
        $0.textColor = .systemGray2
        $0.text = "Interesse"
        $0.textAlignment = .center

    }

    lazy var boxInteresse: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let box = UICollectionView(frame: .zero, collectionViewLayout: layout)
        box.dataSource = self
        box.delegate = self
        box.backgroundColor = .white
        box.register(InteresseCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return box
    }()



    init() {
        super.init(frame: .zero)
        initLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initSubView() {
        
        content.addSubview(labelTitle)
        content.addSubview(boxInteresse)
        addSubview(content)
    }

    func initConstrant() {
        content.layout {
            $0.top.equalToSuperView()
            $0.left.equalToSuperView()
            $0.right.equalToSuperView()
            $0.bottom.equalToSuperView()

        }
        labelTitle.layout {
            $0.top.equalToSuperView()
            $0.left.equalToSuperView()
            $0.right.equalToSuperView()
        }
        boxInteresse.layout {
            $0.top.equal(to: labelTitle.bottomAnchor, offsetBy: 8)
            $0.left.equalToSuperView()
            $0.right.equalToSuperView()
            $0.bottom.equalToSuperView(-16)
        }
    }
}


extension InteresseTanjiroView: UICollectionViewDelegate,
                                UICollectionViewDataSource,
                                UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! InteresseCollectionViewCell
        cell.setup(listCasas[indexPath.row]!)
        return cell
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listCasas.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120.0, height: 120.0)
    }


    func reload() {
        boxInteresse.reloadData()
        layoutIfNeeded()
    }
}
