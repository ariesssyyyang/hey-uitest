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
        setupNavBar()
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

    private func setupNavBar() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showInputAlert))
        addButton.accessibilityIdentifier = "rightBarButtonItem_addButton"
        navigationItem.rightBarButtonItem = addButton
    }

    @objc func showInputAlert() {

    }
}

