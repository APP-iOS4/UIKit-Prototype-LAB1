//
//  ChoiceVegitableViewController.swift
//  Kiosk
//
//  Created by 박상현 on 1/17/24.
//

import UIKit

class ChoiceVegitableViewController: CommonOrderViewController {
    
    let vegitableStore = VegitableStore()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func setupView() {
        super.setupView()
        
        let titleLabel: UILabel = {
            let titleLabel = UILabel()
            titleLabel.text = "야채 선택"
            titleLabel.textColor = .black
            titleLabel.font = .systemFont(ofSize: 30, weight: .regular)
            titleLabel.sizeToFit()
            return titleLabel
        }()
        
        let collectionView: UICollectionView = {
            let collectionViewLayout = UICollectionViewFlowLayout()
            collectionViewLayout.scrollDirection = .vertical
            collectionViewLayout.minimumLineSpacing = 40
            collectionViewLayout.minimumInteritemSpacing = 40
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
            collectionView.register(VegitableCell.self, forCellWithReuseIdentifier: VegitableCell.identifier)
            collectionView.backgroundColor = .clear
            collectionView.delegate = self
            collectionView.dataSource = self
            return collectionView
        }()
        
        view.customAddSubView(titleLabel)
        view.customAddSubView(collectionView)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 23),
            titleLabel.topAnchor.constraint(equalTo: customNavigationBar.bottomAnchor, constant: 34),
            
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 34),
            collectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: sideBar.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
    
}

extension ChoiceVegitableViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vegitableStore.vegitableArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VegitableCell.identifier, for: indexPath) as? VegitableCell else { return UICollectionViewCell() }
        let targetVegitable = vegitableStore.vegitableArray[indexPath.row]
        cell.vegitableTitle = "\(targetVegitable.name)"
        cell.vegitableEngTitle = "\(targetVegitable.engName)"
        cell.vegitableCalTitle = "\(targetVegitable.cal)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let collectionViewSize: CGSize = collectionView.frame.size
        let cellWidth: CGFloat = (collectionViewSize.width - 160) / 3

        
        return CGSize(width: cellWidth, height: 400)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
    }
    
    
}
