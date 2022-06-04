//
//  DateCollectionView.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 4.06.22.
//

import UIKit

class DateCollectionView: UICollectionView {
    
    private let daysCount = 14
    private let calendar = Calendar.current
    private var dates = [Date]()
    weak var viewDelegate: ScheduleViewDelegate!
    
    init(viewDelegate: ScheduleViewDelegate) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        self.viewDelegate = viewDelegate
        fillDates()
        
        translatesAutoresizingMaskIntoConstraints = false
        contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        layout.minimumLineSpacing = Configs.Constants.minimumLineSpacing
        allowsSelection = true
        
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        
        delegate = self
        dataSource = self
        register(DateCollectionCell.self, forCellWithReuseIdentifier: DateCollectionCell.cellIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fillDates() {
        var date = Date()
        for _ in 1...daysCount {
            dates.append(date)
            date = date.getNextDay()
        }
    }
    
    func getTodayDate() -> Date {
        return dates[0]
    }

}

extension DateCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dates.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.dequeueReusableCell(withReuseIdentifier: DateCollectionCell.cellIdentifier, for: indexPath) as! DateCollectionCell
        
        let date = dates[indexPath.row]
        
        cell.weekDayLabel.text = date.getWeekDayString()
        cell.dayLabel.text = date.getDayNumberString()
        
        return cell
    }
    
    
}

extension DateCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Configs.Constants.dateCollectionItemWidth, height: Configs.Constants.dateCollectionItemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewDelegate.choose(day: dates[indexPath.row])
    }
}

extension DateCollectionView: UICollectionViewDelegate {}
