//
//  SandwichViewController.swift
//  Kiosk
//
//  Created by woong on 1/17/24.
//

import UIKit

class SandwichViewController: CommonViewController {

    let sandwichStore = SandwichStore()
    var sandwichCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    let sandwichButton = SandwichButton()
    
    var screenWidth = 0.0
    var screenHeight = 0.0
    
    override func setupView() {
        super.setupView()
        screenWidth = self.view.bounds.width
        screenHeight = self.view.bounds.height
        
        sandwichCollectionView = {
            let collectionViewLayout = UICollectionViewFlowLayout()
            collectionViewLayout.itemSize = CGSize(width: screenWidth / 5.0, height: screenHeight / 3.0)
            collectionViewLayout.scrollDirection = .vertical
            collectionViewLayout.minimumLineSpacing = 80
            collectionViewLayout.minimumInteritemSpacing = 10
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.register(SandwichButton.self, forCellWithReuseIdentifier: sandwichButton.sandwichButtonID)
            return collectionView
        }()
        
        customNavigationBar.delegate = self
        customNavigationBar.title = "타이틀 테스트"
        sandwichCollectionView.backgroundColor = .systemGray6
        self.view.addSubview(sandwichCollectionView)
        
        sandwichCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sandwichCollectionView.topAnchor.constraint(equalTo: customNavigationBar.bottomAnchor, constant: 40),
            sandwichCollectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            sandwichCollectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 40),
            sandwichCollectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -40)
        ])
        
        sandwichCollectionView.delegate = self
        sandwichCollectionView.dataSource = self
//        sandwichCollectionView.register(SandwichButton.self, forCellWithReuseIdentifier: sandwichButton.sandwichButtonID)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// MARK: 델리게이트, 데이터소스

extension SandwichViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(sandwichStore.sandwiches.count)
        return sandwichStore.sandwiches.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sandwichCollectionView.dequeueReusableCell(withReuseIdentifier: "SandwichButton", for: indexPath) as! SandwichButton
        
        cell.sandwichImageView.image = UIImage(named: "card")
        cell.sandwichTitle = sandwichStore.sandwiches[indexPath.row].korName
        cell.sandwichEngTitle = sandwichStore.sandwiches[indexPath.row].engName
        if let cal = sandwichStore.sandwiches[indexPath.row].cal {
            cell.sandwichCalTitle = String(cal) + "kcal"
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = sandwichCollectionView.cellForItem(at: indexPath) as! SandwichButton
        cell.isSelect.toggle()
    }
}

// MARK: 커스텀 네비게이션바 프로토콜(함수 설정해주기)

extension SandwichViewController: CustomNavigationBarProtocol {
    func didTapHomeButton() {
        print("홈")
    }
    
    func didTapRightButton() {
        print("장바구니")
    }
    
    func didTapBackButton() {
        print("이전으로")
    }
    
}
