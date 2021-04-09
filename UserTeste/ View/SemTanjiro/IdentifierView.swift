//
//  IdentifierView.swift
//  UserTeste
//
//  Created by André Haas on 07/04/21.
//

import UIKit

class IdentifierView: UIView, DefaultViewProtocol {

    lazy var content = UIView()
    lazy var photoImagemView = UIImageView()
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.medium)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    lazy var originLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    lazy var originTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .systemGray2
        label.text = "Origem"
        label.textAlignment = .center
        return label
    }()

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
        constraintPhotoImagemView()
        constraintNameLabel()
        constraintPhoneLabel()
        constraintEmailLabel()
        constraintOriginLabel()
        constraintOriginTitleLabel()
    }

    private func constraintContent() {
        content.translatesAutoresizingMaskIntoConstraints = false
        let botton = NSLayoutConstraint(item: content, attribute: .bottom, relatedBy: .equal, toItem: originLabel, attribute: .bottom, multiplier: 1, constant: 16.0)

        let left = NSLayoutConstraint(item: content, attribute: .left, relatedBy: .equal, toItem: self.superview, attribute: .left, multiplier: 1, constant: 0.0)

        let right = NSLayoutConstraint(item: content, attribute: .right, relatedBy: .equal, toItem: self.superview, attribute: .right, multiplier: 1, constant: 0.0)

        let top = NSLayoutConstraint(item: content, attribute: .top, relatedBy: .equal, toItem: self.superview, attribute: .top, multiplier: 1, constant: 0.0)
        NSLayoutConstraint.activate([botton, left, right, top])
    }

    private func constraintNameLabel() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        let left = NSLayoutConstraint(item: nameLabel, attribute: .left, relatedBy: .equal, toItem: content, attribute: .left, multiplier: 1, constant: 0.0)

        let right = NSLayoutConstraint(item: nameLabel, attribute: .right, relatedBy: .equal, toItem: content, attribute: .right, multiplier: 1, constant: 0.0)

        let top = NSLayoutConstraint(item: nameLabel, attribute: .top, relatedBy: .equal, toItem: photoImagemView, attribute: .bottom, multiplier: 1, constant: 16.0)
        NSLayoutConstraint.activate([left, right, top])
    }

    private func constraintPhoneLabel() {
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        let left = NSLayoutConstraint(item: phoneLabel, attribute: .left, relatedBy: .equal, toItem: content, attribute: .left, multiplier: 1, constant: 0.0)

        let right = NSLayoutConstraint(item: phoneLabel, attribute: .right, relatedBy: .equal, toItem: content, attribute: .right, multiplier: 1, constant: 0.0)

        let top = NSLayoutConstraint(item: phoneLabel, attribute: .top, relatedBy: .equal, toItem: nameLabel, attribute: .bottom, multiplier: 1, constant: 16.0)
        NSLayoutConstraint.activate([left, right, top])
    }

    private func constraintEmailLabel() {
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        let left = NSLayoutConstraint(item: emailLabel, attribute: .left, relatedBy: .equal, toItem: content, attribute: .left, multiplier: 1, constant: 0.0)

        let right = NSLayoutConstraint(item: emailLabel, attribute: .right, relatedBy: .equal, toItem: content, attribute: .right, multiplier: 1, constant: 0.0)

        let top = NSLayoutConstraint(item: emailLabel, attribute: .top, relatedBy: .equal, toItem: phoneLabel, attribute: .bottom, multiplier: 1, constant: 16.0)
        NSLayoutConstraint.activate([left, right, top])
    }

    private func constraintOriginTitleLabel() {
        originTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        let left = NSLayoutConstraint(item: originTitleLabel, attribute: .left, relatedBy: .equal, toItem: content, attribute: .left, multiplier: 1, constant: 0.0)

        let right = NSLayoutConstraint(item: originTitleLabel, attribute: .right, relatedBy: .equal, toItem: content, attribute: .right, multiplier: 1, constant: 0.0)

        let top = NSLayoutConstraint(item: originTitleLabel, attribute: .top, relatedBy: .equal, toItem: emailLabel, attribute: .bottom, multiplier: 1, constant: 24.0)
        NSLayoutConstraint.activate([left, right, top])
    }

    private func constraintOriginLabel() {
        originLabel.translatesAutoresizingMaskIntoConstraints = false
        let left = NSLayoutConstraint(item: originLabel, attribute: .left, relatedBy: .equal, toItem: content, attribute: .left, multiplier: 1, constant: 0.0)

        let right = NSLayoutConstraint(item: originLabel, attribute: .right, relatedBy: .equal, toItem: content, attribute: .right, multiplier: 1, constant: 0.0)

        let top = NSLayoutConstraint(item: originLabel, attribute: .top, relatedBy: .equal, toItem: originTitleLabel, attribute: .bottom, multiplier: 1, constant: 16.0)
        NSLayoutConstraint.activate([left, right, top])
    }

    private func constraintPhotoImagemView() {

        photoImagemView.translatesAutoresizingMaskIntoConstraints = false
        let top = NSLayoutConstraint(item: photoImagemView, attribute: .top, relatedBy: .equal, toItem: content, attribute: .top, multiplier: 1.0, constant: 16.0)
        let height =  NSLayoutConstraint(item: photoImagemView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100)

        let width =  NSLayoutConstraint(item: photoImagemView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100)

        let centerX =  NSLayoutConstraint(item: photoImagemView, attribute: .centerX, relatedBy: .equal, toItem: content, attribute: .centerX, multiplier: 1.0, constant: 0.0)

        NSLayoutConstraint.activate([height, width, top, centerX])
    }

    func setup(_ clientViewModel: ClientViewModel) {
        
        photoImagemView.image = UIImage(named: "img_user_sem_foto")
        photoImagemView.contentMode = .scaleAspectFill

        nameLabel.text = clientViewModel.name
        phoneLabel.text = clientViewModel.phone
        emailLabel.text = clientViewModel.email
        originLabel.text = clientViewModel.origin
        constraintContent()
        layoutIfNeeded()

    }
}
