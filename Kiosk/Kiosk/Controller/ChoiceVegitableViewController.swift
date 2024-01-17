//
//  ChoiceVegitableViewController.swift
//  Kiosk
//
//  Created by 박상현 on 1/17/24.
//

import UIKit

class ChoiceVegitableViewController: CommonViewController {
    
    let sideBar = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func setupView() {
        super.setupView()
        
        // 네비게이션바 설정
        customNavigationBar.delegate = self
        customNavigationBar.title = "빵선택 > 토핑선택 > 야채선택 > 소스"
        
        // 사이드바 설정
        sideBar.backgroundColor = .init(named: "mainGreen")?.withAlphaComponent(0.65)
        
        // 야채선택 레이블
        let titleLabel: UILabel = {
            let titleLabel = UILabel()
            titleLabel.text = "야채 선택"
            titleLabel.font = .systemFont(ofSize: 30, weight: .regular)
            titleLabel.sizeToFit()
            return titleLabel
        }()
        
        // 컬렉션뷰 설정
        let collectionViewLayout: UICollectionViewLayout = {
            let collectionViewLayout = UICollectionViewFlowLayout()
            collectionViewLayout.scrollDirection = .vertical
            return collectionViewLayout
        }()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // MARK: AddSubView
        view.customAddSubView(sideBar)
        view.customAddSubView(titleLabel)
        view.customAddSubView(collectionView)
        
        // MARK: AutoLayout
        NSLayoutConstraint.activate([
            sideBar.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            sideBar.topAnchor.constraint(equalTo: customNavigationBar.bottomAnchor),
            sideBar.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            sideBar.widthAnchor.constraint(equalToConstant: 326),
            
            titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 23),
            titleLabel.topAnchor.constraint(equalTo: customNavigationBar.bottomAnchor, constant: 34),
            
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            collectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: sideBar.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        ])
    }

}

// MARK: - UICollectionView Delegate & DataSource
extension ChoiceVegitableViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 0
    }
}

// MARK: - CustomNavigationBar Delegate
extension ChoiceVegitableViewController: CustomNavigationBarProtocol {
    func didTapHomeButton() {
        print("didTap HomeButton")
    }
    
    func didTapRightButton() {
        print("didTap RightButton")
    }
    
    func didTapBackButton() {
        print("didTap BackButton")
    }
    
    
}
