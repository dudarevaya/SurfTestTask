//
//  JoinSurfViewManager.swift
//  TestTask
//
//  Created by Yana Dudareva on 10.02.2023.
//

import UIKit
 
protocol JoinSurfViewManagerProtocol {
    func setJobsArray(jobModels: [JoinSurfJobsModel])
}

final class JoinSurfViewManager: NSObject, JoinSurfViewManagerProtocol {
    
    // MARK: - Private Properties

    private var jobsArray: [JoinSurfJobsModel] = []
    private var tappedCells: [Int: JoinSurfJobsModel] = [:]
    
    func setJobsArray(jobModels: [JoinSurfJobsModel]) {
        self.jobsArray = jobModels
    }
}

// MARK: - UICollectionViewDataSorce

extension JoinSurfViewManager: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int
    ) -> Int {
        return jobsArray.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: JoinSurfJobCell.identifier,
            for: indexPath
        ) as? JoinSurfJobCell
        else { return UICollectionViewCell() }
        
        cell.configure(model: jobsArray[indexPath.row])
        
        if tappedCells[indexPath.row] != nil {
            cell.isTapped = true
        } else {
            cell.isTapped = false
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath
    ) {
        if tappedCells[indexPath.row] != nil {
            tappedCells.removeValue(forKey: indexPath.row)
        } else {
            tappedCells[indexPath.row] = jobsArray[indexPath.row]
        }
    }
}

// MARK: - UICollectionViewDelegate

extension JoinSurfViewManager: UICollectionViewDelegate {
}
