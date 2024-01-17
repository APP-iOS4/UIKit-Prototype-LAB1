//
//  ToppingViewController.swift
//  Kiosk
//
//  Created by woong on 1/17/24.
//

import UIKit

class ToppingViewController: CommonViewController {
    
    let cheeseStore = CheeseStore()
    var cheeseCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    var toppingCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let cheeseButton = SandwichButton()
    
    var cheeseLabel = UILabel()
    var toppingLabel = UILabel()
    
    var screenWidth = 0.0
    var screenHeight = 0.0
    
    var cheeseCellHeight = 0.0
    
    override func setupView() {
        super.setupView()
        
        screenWidth = self.view.bounds.width
        screenHeight = self.view.bounds.height
        
        cheeseLabel = {
            let label = UILabel()
            label.text = "치즈 선택"
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 40, weight: .heavy)
            return label
        }()
        
        toppingLabel = {
            let label = UILabel()
            label.text = "추가 토핑 선택"
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 40, weight: .heavy)
            return label
        }()
        
        cheeseCollectionView = {
            let collectionViewLayout = UICollectionViewFlowLayout()
            collectionViewLayout.itemSize = CGSize(width: screenWidth / 5.0, height: screenHeight / 3.0)
            collectionViewLayout.scrollDirection = .vertical
            collectionViewLayout.minimumLineSpacing = 80
            collectionViewLayout.minimumInteritemSpacing = 10
            
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.register(SandwichButton.self, forCellWithReuseIdentifier: cheeseButton.sandwichButtonID)
            cheeseCellHeight = collectionViewLayout.itemSize.height
            return collectionView
        }()
        
        toppingCollectionView = {
            let collectionViewLayout = UICollectionViewFlowLayout()
            collectionViewLayout.itemSize = CGSize(width: screenWidth / 5.0, height: screenHeight / 3.0)
            collectionViewLayout.scrollDirection = .vertical
            collectionViewLayout.minimumLineSpacing = 80
            collectionViewLayout.minimumInteritemSpacing = 10
            
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.register(SandwichButton.self, forCellWithReuseIdentifier: cheeseButton.sandwichButtonID)
            cheeseCellHeight = collectionViewLayout.itemSize.height
            return collectionView
        }()
        
        
        
        customNavigationBar.delegate = self
        customNavigationBar.title = "토핑 테스트"
        cheeseCollectionView.backgroundColor = .systemGray6
        self.view.customAddSubView(cheeseLabel)
        self.view.addSubview(cheeseCollectionView)
        self.view.customAddSubView(toppingLabel)
        
        cheeseCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cheeseLabel.topAnchor.constraint(equalTo: customNavigationBar.bottomAnchor, constant: 40),
            cheeseLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 40),
            
            cheeseCollectionView.topAnchor.constraint(equalTo: cheeseLabel.bottomAnchor, constant: 20),
            cheeseCollectionView.heightAnchor.constraint(equalToConstant: cheeseCellHeight + 40),
            cheeseCollectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 40),
            cheeseCollectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -40),
            
            toppingLabel.topAnchor.constraint(equalTo: cheeseCollectionView.bottomAnchor, constant: 20),
            toppingLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20)
            
            
            
        ])
        
        cheeseCollectionView.delegate = self
        cheeseCollectionView.dataSource = self
        cheeseCollectionView.register(SandwichButton.self, forCellWithReuseIdentifier: cheeseButton.sandwichButtonID)
        
    }
    
    override func viewDidLoad() { super.viewDidLoad() }
}

extension ToppingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return cheeseStore.cheese.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if collectionView == cheeseCollectionView {
//            
//        } else {
//            
//        }
        
        let cell = cheeseCollectionView.dequeueReusableCell(withReuseIdentifier: "SandwichButton", for: indexPath) as! SandwichButton
        
        cell.sandwichImageView.image = UIImage(named: "card")
        cell.sandwichTitle = cheeseStore.cheese[indexPath.row].korName
        cell.sandwichEngTitle = cheeseStore.cheese[indexPath.row].engName
        if let cal = cheeseStore.cheese[indexPath.row].cal {
            cell.sandwichCalTitle = String(cal) + "kcal"
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var selectedCellIndex: IndexPath?
        
        let cell = cheeseCollectionView.cellForItem(at: indexPath) as! SandwichButton
        
        if let selectedCellIndex = selectedCellIndex {
            collectionView.deselectItem(at: selectedCellIndex, animated: false)
        }
        cell.isSelect.toggle()
    }
    
}


extension ToppingViewController: CustomNavigationBarProtocol {
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

