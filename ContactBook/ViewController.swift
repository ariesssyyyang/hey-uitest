//
//  ViewController.swift
//  ContactBook
//
//  Created by Aries Yang on 2021/6/4.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupEmptyView()
    }

    private func setupEmptyView() {
        let label = UILabel()
        label.text = "Tap + button to add contacts."
        label.textColor = .lightGray
        label.center = view.center
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

