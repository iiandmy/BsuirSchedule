//
//  ViewController.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 26.03.22.
//

import UIKit

protocol ScheduleViewProtocol: AnyObject {
    func succesScheduleLoad(facultyName: String)
    func failureScheduleLoad(error: String)
    func reloadTableView()
}

class TableViewCell: UITableViewCell {}

class ScheduleViewController: UIViewController {

    // MARK: Dependencies
    var presenter: SchedulePresenterProtocol!
    
    // MARK: Views
    let tableView: UITableView = {
        let table = UITableView.init(frame: .zero, style: .plain)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Schedule"
        
        makeUI()
        updateLayout(with: view.frame.size)
    }
    
    private func makeUI() {
        registerCell()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsSelection = false
        view.addSubview(tableView)
    }
    
    func registerCell() {
        let scheduleCell = UINib(nibName: "ScheduleCell", bundle: nil)
        self.tableView.register(scheduleCell, forCellReuseIdentifier: "scheduleCell")
    }
    
    private func updateLayout(with size: CGSize) {
        tableView.frame = CGRect(origin: .zero, size: size)
    }
    
}

extension ScheduleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getPairCount() ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell", for: indexPath) as! ScheduleCell
        
        guard let pair = presenter.getPair(withNumber: indexPath.row) else {
            return cell
        }
        
        cell.setLayout(withSubject: pair.subject!, professor: pair.employee?.first?.fio ?? "Failed", startTime: pair.startLessonTime!, endTime: pair.endLessonTime!, auditory: pair.auditory?.first ?? "100", pairType: pair.lessonType!)
        
        return cell
    }
    
}

extension ScheduleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        91
    }
}

extension ScheduleViewController: ScheduleViewProtocol {
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func succesScheduleLoad(facultyName: String) {
        print(facultyName)
    }
    
    func failureScheduleLoad(error: String) {
        print(error)
    }
    
    
}
