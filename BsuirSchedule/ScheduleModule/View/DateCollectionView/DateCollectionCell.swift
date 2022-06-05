//
//  DateCollectionCellCollectionViewCell.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 4.06.22.
//

import UIKit

class DateCollectionCell: UICollectionViewCell {
    
    static let cellIdentifier = "dateCollectionViewCell"
    
    let weekDayLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.text = "ПН"
        dateLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        dateLabel.textAlignment = .center
        return dateLabel
    }()
    
    let dayLabel: UILabel = {
        let dayLabel = UILabel()
        dayLabel.textAlignment = .center
        dayLabel.text = "29"
        return dayLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(weekDayLabel)
        addSubview(dayLabel)
        
        backgroundColor = .systemGray6
        layer.cornerRadius = 5
        
        initConstraints()
    }
    
    private func initConstraints() {
        weekDayLabel.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            weekDayLabel.topAnchor.constraint(equalTo: topAnchor, constant: Configs.Constraints.regularConstraint),
            weekDayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Configs.Constraints.regularConstraint),
            weekDayLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Configs.Constraints.regularConstraint),
            dayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Configs.Constraints.regularConstraint),
            dayLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Configs.Constraints.regularConstraint),
            dayLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Configs.Constraints.regularConstraint)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
