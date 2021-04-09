//
//  ViewController.swift
//  UserTeste
//
//  Created by André Haas on 07/04/21.
//

import UIKit
import Tanjiro

class ViewController: UIViewController, DefaultViewProtocol {
    //    sem Tanjiro
    //    lazy var identifier = IdentifierView()
    //    lazy var boxInteresse = InteresseView()

    //Com tanjiro
    lazy var identifier = IdentifierTanjiroView()
    lazy var boxInteresse = InteresseTanjiroView()
    lazy var boxMessage = MensageView()
    lazy var scrollView = UIScrollView()
    lazy var content = UIStackView().with {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment =  .center
        $0.spacing = 5
    }

    var modelView: ClientViewModel {
        get {
            let viewModel = ClientViewModel()
            return viewModel.getData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        initLayout()
        identifier.setup(modelView)
        boxInteresse.reload()
        content.backgroundColor = .white
    }
    
    func initSubView() {

        content.addArrangedSubview(identifier)
        content.addArrangedSubview(boxInteresse)
        content.addArrangedSubview(boxMessage)
        scrollView.addSubview(content)
        view.addSubview(scrollView)
    }
    
    func initConstrant() {

        //Com Tanjiro
        scrollView.layout {
            $0.top.equal(to: view.safeAreaLayoutGuide.topAnchor)
            $0.bottom.equal(to: view.safeAreaLayoutGuide.bottomAnchor)
            $0.left.equalToSuperView()
            $0.right.equalToSuperView()
        }

        content.layout {
            $0.top.equalToSuperView(24)
            $0.left.equalToSuperView(24)
            $0.right.equalToSuperView(-24)
            $0.bottom.equalToSuperView(-16)
            $0.centerX.equalToSuperView()
            $0.height.constraint(equalToConstant: 820)
        }

        identifier.layout {
            $0.top.equalToSuperView(24)
            $0.left.equalToSuperView()
            $0.right.equalToSuperView()
            $0.height.constraint(equalToConstant: 300)

        }

        boxInteresse.layout {
            $0.top.equal(to: identifier.bottomAnchor, offsetBy: 16)
            $0.left.equalToSuperView()
            $0.right.equalToSuperView()
            $0.height.constraint(equalToConstant: 200)
        }

        boxMessage.layout {
            $0.top.equal(to: boxInteresse.bottomAnchor, offsetBy: 16)
            $0.left.equalToSuperView()
            $0.right.equalToSuperView()
            $0.height.constraint(equalToConstant: 200)
        }

        //Sem Tamjiro

        //        content.translatesAutoresizingMaskIntoConstraints = false
        //
        //        let top = NSLayoutConstraint(item: content, attribute: .top, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 56.0)
        //
        //        let left = NSLayoutConstraint(item: content, attribute: .left, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .left, multiplier: 1, constant: 24.0)
        //
        //        let right = NSLayoutConstraint(item: content, attribute: .right, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .right, multiplier: 1, constant: -24.0)
        //
        //        let botton = NSLayoutConstraint(item: content, attribute: .bottom, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: -56.0)
        //        NSLayoutConstraint.activate([top, left, right, botton])
        //        loadViewIfNeeded()
    }
}

