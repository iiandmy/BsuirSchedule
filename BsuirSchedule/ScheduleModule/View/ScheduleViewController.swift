//
//  ViewController.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 26.03.22.
//

import UIKit

protocol ScheduleViewProtocol: AnyObject {
    func succesScheduleLoad(firstDay: Date)
    func failureScheduleLoad(error: String)
    func reloadTableView(forDay date: Date)
    func reloadTableView()
}

protocol ScheduleViewDelegate: AnyObject {
    func choose(day: Date)
}

class ScheduleViewController: UIViewController {

    // MARK: Dependencies
    var presenter: SchedulePresenterProtocol!
    
    // MARK: Views
    private let tableView: ScheduleTableView = ScheduleTableView()
    
    private var dayPicker: DateCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dayPicker = DateCollectionView(viewDelegate: self)
        
        view.backgroundColor = .white
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
    
    private func setTitle(withDate date: Date) {
        self.title = "\(date.getWeekDayString()), \(date.getDayNumberString()) \(date.getMonthString())"
    }
    
}

extension ScheduleViewController: ScheduleViewDelegate {
    func choose(day: Date) {
        reloadTableView(forDay: day)
    }
}

extension ScheduleViewController: ScheduleViewProtocol {
    func reloadTableView(forDay date: Date) {
        DispatchQueue.main.async {
            self.setTitle(withDate: date)
            self.tableView.setSchedule(self.presenter.getSchedule(forDay: date.getWeekDayString()))
            self.tableView.reloadData()
        }
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.setTitle(withDate: self.dayPicker.getTodayDate())
            self.tableView.setSchedule(self.presenter.getSchedule(forDay: self.dayPicker.getTodayDate().getWeekDayString()))
        }
    }
    
    func succesScheduleLoad(firstDay: Date) {
        reloadTableView(forDay: firstDay)
    }
    
    func failureScheduleLoad(error: String) {
        print(error)
    }
    
    
}
