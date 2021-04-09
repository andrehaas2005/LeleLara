//
//  Interesse.swift
//  UserTeste
//
//  Created by André Haas on 08/04/21.
//

import UIKit

class InteresseView: UIView, DefaultViewProtocol {

    let listCasas = [UIImage(named: "casa1"),
                     UIImage(named: "casa2"),
                     UIImage(named: "casa3"),
                     UIImage(named: "casa4")]

    lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .systemGray2
        label.text = "Interesse"
        label.textAlignment = .center
        return label
    }()

    lazy var boxInteresse: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let box = UICollectionView(frame: .zero, collectionViewLayout: layout)
        box.dataSource = self
        box.delegate = self
        box.register(InteresseCollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        return box
    }()

    lazy var content = UIView()

    init() {
        super.init(frame: .zero)
        initLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initSubView() {
        content.isUserInteractionEnabled = true
        content.addSubview(labelTitle)
        content.addSubview(boxInteresse)
        self.addSubview(content)
    }

    func initConstrant() {
        constrantTitle()
        constraintBox()
    }

    private func constrantTitle() {
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        let left = NSLayoutConstraint(item: labelTitle, attribute: .left, relatedBy: .equal, toItem: content, attribute: .left, multiplier: 1, constant: 0.0)

        let right = NSLayoutConstraint(item: labelTitle, attribute: .right, relatedBy: .equal, toItem: content, attribute: .right, multiplier: 1, constant: 0.0)

        let top = NSLayoutConstraint(item: labelTitle, attribute: .top, relatedBy: .equal, toItem: content, attribute: .top, multiplier: 1, constant: 16.0)
        NSLayoutConstraint.activate([left, right, top])
    }
    private func constraintBox() {
        boxInteresse.translatesAutoresizingMaskIntoConstraints = false
        let left = NSLayoutConstraint(item: boxInteresse, attribute: .left, relatedBy: .equal, toItem: content, attribute: .left, multiplier: 1, constant: 0.0)

        let right = NSLayoutConstraint(item: boxInteresse, attribute: .right, relatedBy: .equal, toItem: content, attribute: .right, multiplier: 1, constant: 0.0)
        //        let height =  NSLayoutConstraint(item: boxInteresse, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 200.0)

        let top = NSLayoutConstraint(item: boxInteresse, attribute: .top, relatedBy: .equal, toItem: labelTitle, attribute: .bottom, multiplier: 1, constant: 16.0)
        NSLayoutConstraint.activate([left, right, top])
        boxInteresse.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }

    func setup(view: UIView) {
        content.translatesAutoresizingMaskIntoConstraints = false
        let botton = NSLayoutConstraint(item: content, attribute: .bottom, relatedBy: .equal, toItem: self.superview, attribute: .bottom, multiplier: 1, constant: 16.0)

        let left = NSLayoutConstraint(item: content, attribute: .left, relatedBy: .equal, toItem: self.superview, attribute: .left, multiplier: 1, constant: 0.0)

        let right = NSLayoutConstraint(item: content, attribute: .right, relatedBy: .equal, toItem: self.superview, attribute: .right, multiplier: 1, constant: 0.0)

        let top = NSLayoutConstraint(item: content, attribute: .top, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0.0)
        NSLayoutConstraint.activate([botton, left, right, top])
        self.layoutIfNeeded()
    }
}


extension InteresseView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listCasas.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! InteresseCollectionViewCell
        myCell.setup(listCasas[indexPath.row] ?? UIImage(named: "img_user_sem_foto")!)
        return myCell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
    }

}
