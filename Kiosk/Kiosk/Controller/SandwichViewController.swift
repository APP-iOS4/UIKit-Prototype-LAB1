//
//  SandwichViewController.swift
//  Kiosk
//
//  Created by woong on 1/17/24.
//

import UIKit

class SandwichViewController: CommonViewController {

    let sandwichStore = SandwichStore()
    let sandwichCollectionView: UICollectionView
    let sandwichButton = SandwichButton()
    
    var screenWidth = 0.0
    var screenHeight = 0.0
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        let layout = UICollectionViewFlowLayout()
//        let itemWidth = screenWidth / 4.0
        
        layout.itemSize = CGSize(width: screenWidth / 4.0, height: screenHeight)
        layout.minimumLineSpacing = 40
        layout.minimumInteritemSpacing = 40
        
        sandwichCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupView() {
        super.setupView()
        screenWidth = self.view.bounds.width
        screenHeight = self.view.bounds.height
        
        let safeArea: UILayoutGuide = view.safeAreaLayoutGuide
        
        customNavigationBar.delegate = self
        customNavigationBar.title = "타이틀 테스트"
        
        sandwichCollectionView.backgroundColor = .systemMint
        self.view.addSubview(sandwichCollectionView)
        
        sandwichCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sandwichCollectionView.topAnchor.constraint(equalTo: customNavigationBar.bottomAnchor),
            sandwichCollectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            sandwichCollectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            sandwichCollectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
        
        sandwichCollectionView.delegate = self
        sandwichCollectionView.dataSource = self
        sandwichCollectionView.register(SandwichButton.self, forCellWithReuseIdentifier: "SandwichButton")
        
        print()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //    func aaa() {
    //        sandwichButton.sandwichTitle = "랍스터"
    //        sandwichButton.sandwichEngTitle = "랍스터"
    //        sandwichButton.sandwichCalTitle = "랍스터kcal"
    //
    //        view.customAddSubView(sandwichButton)
    //
    //        NSLayoutConstraint.activate([
    //            sandwichButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
    //            sandwichButton.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
    //            sandwichButton.widthAnchor.constraint(equalToConstant: 349),
    //            sandwichButton.bottomAnchor.constraint(equalTo: sandwichButton.sandwichCalLabel.bottomAnchor, constant: 26)
    //        ])
    //
    //    }
    
}

// MARK: 델리게이트, 데이터소스

extension SandwichViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sandwichStore.sandwiches.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sandwichCollectionView.dequeueReusableCell(withReuseIdentifier: "SandwichButton", for: indexPath) as! SandwichButton
        
        cell.sandwichImageView.image = UIImage(named: "card")
        cell.sandwichTitle = sandwichStore.sandwiches[indexPath.row].korName
        cell.sandwichEngTitle = sandwichStore.sandwiches[indexPath.row].engName
        cell.sandwichCalTitle = String(sandwichStore.sandwiches[indexPath.row].cal)
        
        return cell
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
