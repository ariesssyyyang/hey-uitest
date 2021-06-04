//
//  ViewController.swift
//  ContactBook
//
//  Created by Aries Yang on 2021/6/4.
//

import UIKit

class ViewController: UIViewController {

    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupEmptyView()
        setupNavBar()
        setupTableView()
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
        let alert = UIAlertController(
            title: "Add a contact",
            message: "Please enter the information.",
            preferredStyle: .alert
        )
        alert.addTextField(configurationHandler: { $0.placeholder = "Name" })
        alert.addTextField(configurationHandler: {
            $0.placeholder = "Phone number"
            $0.keyboardType = .numberPad
        })
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    private func setupTableView() {
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

