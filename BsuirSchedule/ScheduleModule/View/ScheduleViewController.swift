//
//  ViewController.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 26.03.22.
//

import UIKit

protocol ScheduleViewProtocol: AnyObject {
    func succesScheduleLoad()
    func failureScheduleLoad(error: String)
    func reloadTableView()
}

class ScheduleViewController: UIViewController {

    // MARK: Dependencies
    var presenter: SchedulePresenterProtocol!
    
    // MARK: Views
    let tableView: UITableView = ScheduleTableView()
    
    let dayPicker: UICollectionView = DateCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        self.title = "ВТ, 1 сентября"
        makeUI()
        makeConstraints()
    }
    
    private func makeUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(dayPicker)
        view.addSubview(tableView)
    }
    
    private func makeConstraints() {
        dayPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        dayPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        dayPicker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        dayPicker.heightAnchor.constraint(equalToConstant: Configs.Constants.dateCollectionItemWidth + 2 * Configs.Constants.minimumLineSpacing).isActive = true
        
        tableView.topAnchor.constraint(equalTo: dayPicker.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}

extension ScheduleViewController: ScheduleViewProtocol {
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func succesScheduleLoad() {
        reloadTableView()
    }
    
    func failureScheduleLoad(error: String) {
        print(error)
    }
    
    
}
