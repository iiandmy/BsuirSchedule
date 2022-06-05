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
    private var subgroupNum = 0
    
    // MARK: Views
    private let tableView: ScheduleTableView = ScheduleTableView()
    
    private var dayPicker: DateCollectionView!
    
    private let dayLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 34, weight: .heavy)
        return label
    }()
    
    private let subgroupButton: UIButton = {
        let button = UIButton()
        button.setImage(Configs.Icons.fullGroupImage, for: .normal)
        button.addTarget(self, action: #selector(subgroupButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dayPicker = DateCollectionView(viewDelegate: self)
        setTitle(withDate: dayPicker.getChoosenDate())
        
        view.backgroundColor = .white
        makeUI()
        makeConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.refreshSchedule()
        reloadTableView(forDay: dayPicker.getChoosenDate())
    }
    
    private func makeUI() {
        navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(dayLabel)
        view.addSubview(subgroupButton)
        view.addSubview(dayPicker)
        view.addSubview(tableView)
    }
    
    @objc func subgroupButtonPressed() {
        subgroupNum += 1
        if (subgroupNum > 2) {
            subgroupNum = 0
        }
        switch subgroupNum {
        case 0: subgroupButton.setImage(Configs.Icons.fullGroupImage, for: .normal)
        case 1: subgroupButton.setImage(Configs.Icons.firstSubgroupImage, for: .normal)
        case 2: subgroupButton.setImage(Configs.Icons.secondSubgroupImage, for: .normal)
        default: break
        }
        reloadTableView(forDay: dayPicker.getChoosenDate())
    }
    
    private func makeConstraints() {
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        subgroupButton.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            dayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Configs.Constraints.regularLargeConstraint),
            dayLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Configs.Constraints.regularLargeConstraint * 3),
            subgroupButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            subgroupButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16 * 3),
            subgroupButton.heightAnchor.constraint(equalToConstant: 40),
            subgroupButton.widthAnchor.constraint(equalToConstant: 40)
        ]
        NSLayoutConstraint.activate(constraints)
        
        dayPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        dayPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        dayPicker.topAnchor.constraint(equalTo: dayLabel.bottomAnchor).isActive = true
        dayPicker.heightAnchor.constraint(equalToConstant: Configs.Constants.dateCollectionItemWidth + 2 * Configs.Constants.minimumLineSpacing).isActive = true
        
        tableView.topAnchor.constraint(equalTo: dayPicker.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    private func setTitle(withDate date: Date) {
        dayLabel.text = "\(date.getWeekDayString()), \(date.getDayNumberString()) \(date.getMonthString())"
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
            let weekNum = Date().getWeekNumber(for: date, currentNumber: ScheduleRepo.shared.currentWeek ?? 1)
            self.setTitle(withDate: date)
            self.tableView.setSchedule(self.presenter.getSchedule(forDay: date.getWeekDayString(), inWeek: weekNum, forSubgroup: self.subgroupNum))
        }
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            let weekNum = Date().getWeekNumber(for: self.dayPicker.getChoosenDate(), currentNumber: ScheduleRepo.shared.currentWeek ?? 1)
            self.setTitle(withDate: self.dayPicker.getChoosenDate())
            self.tableView.setSchedule(self.presenter.getSchedule(forDay: self.dayPicker.getChoosenDate().getWeekDayString(), inWeek: weekNum, forSubgroup: self.subgroupNum))
        }
    }
    
    func succesScheduleLoad(firstDay: Date) {
        reloadTableView(forDay: firstDay)
    }
    
    func failureScheduleLoad(error: String) {
        print(error)
    }
    
    
}
