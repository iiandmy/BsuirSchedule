//
//  SearchViewController.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 5.06.22.
//

import UIKit

protocol SearchViewProtocol {
    func loadGroups(_ groups: [Group])
    func showAlert(withTitle title: String, andMessage message: String)
}

protocol SearchViewDelegate {
    func processInput(_ input: String)
    func setGroup(_ group: Group)
}

class SearchViewController: UIViewController {
    
    var presenter: SearchPresenterProtocol!

    private var groupTableView: GroupsTableView = GroupsTableView()
    
    private lazy var searchTextField: GroupSearchField = {
        let textField = GroupSearchField(viewDelegate: self)
        return textField
    }()
    
    override func viewDidLoad() {
        groupTableView.viewDelegate = self
        super.viewDidLoad()
        
        makeSettings()
        makeUI()
        makeConstraints()
    }
    
    func makeSettings() {
        title = "Groups"
        view.backgroundColor = .white
    }
    
    func makeUI() {
        view.addSubview(searchTextField)
        view.addSubview(groupTableView)
    }
    
    func makeConstraints() {
        let constraints = [
            searchTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Configs.Constraints.regularLargeConstraint),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Configs.Constraints.regularLargeConstraint),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Configs.Constraints.regularLargeConstraint),
            groupTableView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: Configs.Constraints.regularLargeConstraint),
            groupTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Configs.Constraints.regularLargeConstraint),
            groupTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Configs.Constraints.regularLargeConstraint),
            groupTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: Configs.Constraints.regularLargeConstraint)
            
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
}

extension SearchViewController: SearchViewProtocol {
    func loadGroups(_ groups: [Group]) {
        groupTableView.setGroups(groups)
    }
    
    func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        guard let tbc = tabBarController else { return }
        tbc.present(alert, animated: true, completion: nil)
    }
}

extension SearchViewController: SearchViewDelegate {
    func processInput(_ input: String) {
        presenter.searchGroups(withNums: input)
    }
    
    func setGroup(_ group: Group) {
        presenter.saveSchedule(forGroup: group.name)
    }
}
