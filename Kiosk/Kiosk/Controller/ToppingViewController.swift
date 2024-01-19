//
//  ToppingViewController.swift
//  Kiosk
//
//  Created by woong on 1/17/24.
//

import UIKit

class ToppingViewController: CommonOrderViewController {

    let cheeseStore = CheeseStore()
    let toppingStore = ToppingStore()
    var toppingScrollView = UIScrollView()
    
    var cheeseCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    var toppingCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    let cheeseButton = SandwichButton()
    var cheeseLabel = UILabel()
    var toppingLabel = UILabel()
    
    var screenWidth = 0.0
    var screenHeight = 0.0
    
    let contentView = UIView()
    
    var cheeseCellHeight = 0.0
    var toppingCellHeight = 0.0
    
    override func setupView() {
        super.setupView()
        screenWidth = self.view.bounds.width
        screenHeight = self.view.bounds.height
        
        currentStep = .choiceTopping
        
        toppingScrollView = {
            let scrollView = UIScrollView()
            scrollView.backgroundColor = .systemGray6
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            return scrollView
        }()
        
        cheeseLabel = {
            let label = UILabel()
            label.text = "치즈 선택"
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 40, weight: .heavy)
            return label
        }()
        
        toppingLabel = {
            let label = UILabel()
            label.text = "토핑 선택"
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
            toppingCellHeight = collectionViewLayout.itemSize.height
            return collectionView
        }()
        

        cheeseCollectionView.backgroundColor = .clear
        toppingCollectionView.backgroundColor = .clear
        
        view.customAddSubView(toppingScrollView)
        toppingScrollView.customAddSubView(contentView)
        
        contentView.customAddSubView(cheeseLabel)
        contentView.customAddSubView(cheeseCollectionView)
        contentView.customAddSubView(toppingLabel)
        contentView.customAddSubView(toppingCollectionView)
        
        NSLayoutConstraint.activate([
            
            toppingScrollView.topAnchor.constraint(equalTo: customNavigationBar.bottomAnchor, constant: 34),
            toppingScrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            toppingScrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 30),
            toppingScrollView.trailingAnchor.constraint(equalTo: sideBar.leadingAnchor, constant: -30),
            
            contentView.topAnchor.constraint(equalTo: toppingScrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: toppingScrollView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: toppingScrollView.trailingAnchor),
            contentView.leadingAnchor.constraint(equalTo: toppingScrollView.leadingAnchor),
            contentView.widthAnchor.constraint(equalTo: toppingScrollView.widthAnchor),
            
            cheeseLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            cheeseLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            
            cheeseCollectionView.topAnchor.constraint(equalTo: cheeseLabel.bottomAnchor, constant: 25),
            cheeseCollectionView.heightAnchor.constraint(equalToConstant: cheeseCellHeight),
            cheeseCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            cheeseCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            
            toppingLabel.topAnchor.constraint(equalTo: cheeseCollectionView.bottomAnchor, constant: 25),
            toppingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            
            toppingCollectionView.topAnchor.constraint(equalTo: toppingLabel.bottomAnchor, constant: 25),
            toppingCollectionView.heightAnchor.constraint(equalToConstant: (toppingCellHeight * 3) + 100),
            toppingCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            toppingCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            toppingCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
        ])
        
        cheeseCollectionView.delegate = self
        cheeseCollectionView.dataSource = self
        toppingCollectionView.delegate = self
        toppingCollectionView.dataSource = self
        
        cheeseCollectionView.register(SandwichButton.self, forCellWithReuseIdentifier: cheeseButton.sandwichButtonID)
        
    }
    
    override func viewDidLoad() { 
        super.viewDidLoad()
        sideBar.sideBarButton.setTitle("다음", color: .init(named: "mainOrange"), isActive: false)
    }
    
    override func didTapSideBarButtonOverride() {
        navigationController?.pushViewController(ChoiceVegitableViewController(), animated: true)
    }
    
}

extension ToppingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        print(collectionView)
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == cheeseCollectionView {
            return cheeseStore.cheese.count
        }
        
        if collectionView == toppingCollectionView {
            return toppingStore.toppings.count
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == cheeseCollectionView {
            let cell = cheeseCollectionView.dequeueReusableCell(withReuseIdentifier: "SandwichButton", for: indexPath) as! SandwichButton
            
            cell.thumbnailView.thumbnailImageView.image = UIImage(named: "c0" + String(indexPath.row + 1))
            cell.sandwichTitle = cheeseStore.cheese[indexPath.row].korName
            cell.sandwichEngTitle = cheeseStore.cheese[indexPath.row].engName
            if let cal = cheeseStore.cheese[indexPath.row].cal {
                cell.sandwichCalTitle = String(cal) + "kcal"
            }
            
            return cell
            
        } else {
            let cell = toppingCollectionView.dequeueReusableCell(withReuseIdentifier: "SandwichButton", for: indexPath) as! SandwichButton
            
            
            cell.thumbnailView.thumbnailImageView.image = UIImage(named: "t0" + String(indexPath.row + 1))
            
            
            cell.sandwichTitle = toppingStore.toppings[indexPath.row].korName
            cell.sandwichEngTitle = toppingStore.toppings[indexPath.row].engName
            
            return cell
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewSize: CGSize = collectionView.frame.size
        let cellWidth: CGFloat = (collectionViewSize.width - 120) / 3
        let cellHeight: CGFloat = ThumbnailView.getDummyHeight(cellWidth, isHighlightTitle: false)
//        collectionView.heightAnchor.constraint(equalToConstant: cellHeight).isActive = true
    
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == cheeseCollectionView {
            guard let cell = cheeseCollectionView.cellForItem(at: indexPath) as? SandwichButton else { return }
            cell.isSelect.toggle()
        } else {
            guard let cell = toppingCollectionView.cellForItem(at: indexPath) as? SandwichButton else { return }
            cell.isSelect.toggle()
        }
        
        
    }
    
}

extension ToppingViewController: ChoiceButtonProtocol {
    func didTapButton() {
        
        print("버튼 눌림")
    }
    
    
}
