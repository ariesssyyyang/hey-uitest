//
//  ViewController.swift
//  ContactBook
//
//  Created by Aries Yang on 2021/6/4.
//

import UIKit

class ViewController: UIViewController {

    private let tableView = UITableView()
    private var contacts: [(name: String, phoneNumber: String)] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavBar()
        setupTableView()
        setupEmptyView()
    }

    private func setupEmptyView() {
        let label = UILabel()
        label.text = "Tap + button to add contacts."
        label.textColor = .lightGray
        label.textAlignment = .center
        tableView.backgroundView = label
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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "THECELL")
        tableView.dataSource = self
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

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "THECELL", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = contacts[indexPath.row].name
        content.secondaryText = contacts[indexPath.row].phoneNumber
        cell.contentConfiguration = content
        return cell
    }

}

