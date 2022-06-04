//
//  DateCollectionView.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 4.06.22.
//

import UIKit

class DateCollectionView: UICollectionView {

    let dates = [Date]()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        translatesAutoresizingMaskIntoConstraints = false
        contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        layout.minimumLineSpacing = Configs.Constants.minimumLineSpacing
        
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        
        delegate = self
        dataSource = self
        register(DateCollectionCell.self, forCellWithReuseIdentifier: DateCollectionCell.cellIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension DateCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        dates.count
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.dequeueReusableCell(withReuseIdentifier: DateCollectionCell.cellIdentifier, for: indexPath)
        
        return cell
    }
    
    
}

extension DateCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Configs.Constants.dateCollectionItemWidth, height: Configs.Constants.dateCollectionItemWidth)
    }
}

extension DateCollectionView: UICollectionViewDelegate {}
