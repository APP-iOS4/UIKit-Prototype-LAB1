//
//  SauceViewController.swift
//  Kiosk
//
//  Created by Woo Sung jong on 1/17/24.
//

import UIKit

class SauceViewController: CommonOrderViewController {

    let sauceStore = SauceStore()
    let cookieStore = CookieStore()
    var scrollview = UIScrollView()
    var contentview = UIView()
    
    var sauceCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    var cookieCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    let sauceButton = SandwichButton()
    let cookieButton = SandwichButton()
    
    var sauceLabel = UILabel()
    var setLabel = UILabel()
    var cookieLabel = UILabel()
    
    var setSingle = ChoiceButton()
    var setCookie = ChoiceButton()
    
    var screenWidth = 0.0
    var screenHeight = 0.0
    
    
    override func setupView() {
        super.setupView()
        screenWidth = self.view.bounds.width
        screenHeight = self.view.bounds.height
        
        // scrollView
        let scrollView = {
            let scrollView = UIScrollView()
            scrollView.backgroundColor = .systemGray6
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            return scrollView
        }()
        
        self.view.addSubview(scrollView)
        
        // contentView
        let contentView = {
            let contentView = UIView()
            contentView.translatesAutoresizingMaskIntoConstraints = false
            return contentView
        }()
        
        scrollView.addSubview(contentView)
        
        
        // Label
        sauceLabel = {
            let label = UILabel()
            label.text = "소스 선택"
            label.textAlignment = .left
            label.font = .systemFont(ofSize: 30, weight: .regular)
            sauceLabel.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        setLabel = {
            let label = UILabel()
            label.text = "세트 선택"
            label.textAlignment = .left
            label.font = .systemFont(ofSize: 30, weight: .regular)
            setLabel.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        cookieLabel = {
            let label = UILabel()
            label.text = "쿠키 선택"
            label.textAlignment = .left
            label.font = .systemFont(ofSize: 30, weight: .regular)
            cookieLabel.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        // button
        setSingle = {
            let label = ChoiceButton()
            label.buttonTitle = "단품"
            setSingle.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        setCookie = {
            let label = ChoiceButton()
            label.buttonTitle = "쿠키세트(음료포함)"
            setCookie.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        // collectionView
        sauceCollectionView = {
            let collectionViewLayout = UICollectionViewFlowLayout()
            collectionViewLayout.itemSize = CGSize(width: screenWidth / 5.0, height: screenHeight / 3.0)
            collectionViewLayout.scrollDirection = .vertical
            collectionViewLayout.minimumLineSpacing = 40
            collectionViewLayout.minimumInteritemSpacing = 10
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.register(SandwichButton.self, forCellWithReuseIdentifier: sauceButton.sandwichButtonID)
            return collectionView
        }()
        
        cookieCollectionView = {
            let collectionViewLayout = UICollectionViewFlowLayout()
            collectionViewLayout.itemSize = CGSize(width: screenWidth / 5.0, height: screenHeight / 3.0)
            collectionViewLayout.scrollDirection = .vertical
            collectionViewLayout.minimumLineSpacing = 40
            collectionViewLayout.minimumInteritemSpacing = 10
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.register(SandwichButton.self, forCellWithReuseIdentifier: cookieButton.sandwichButtonID)
            return collectionView
        }()
        
//        self.view.addSubview(sauceCollectionView)
//        self.view.addSubview(sauceLabel)
//        self.view.addSubview(setLabel)
//        self.view.addSubview(setSingle)
//        self.view.addSubview(setCookie)
//        self.view.addSubview(cookieCollectionView)
//        self.view.addSubview(cookieLabel)

        // contentView 추가
        contentView.addSubview(sauceCollectionView)
        contentView.addSubview(sauceLabel)
        contentView.addSubview(setLabel)
        contentView.addSubview(setSingle)
        contentView.addSubview(setCookie)
        contentView.addSubview(cookieCollectionView)
        contentView.addSubview(cookieLabel)
        
        
        NSLayoutConstraint.activate([
            // scrollView 제약
            scrollView.topAnchor.constraint(equalTo: customNavigationBar.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: sideBar.leadingAnchor),
            
            // contentView 제약
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: cookieCollectionView.bottomAnchor, constant: 20),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            // sauceLabel 제약
            sauceLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 34),
            sauceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 23),
            sauceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            sauceCollectionView.topAnchor.constraint(equalTo: sauceLabel.bottomAnchor, constant: 25),
            sauceCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            sauceCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),

            // setLabel 제약
            setLabel.topAnchor.constraint(equalTo: sauceCollectionView.bottomAnchor, constant: 34),
            setLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 23),
            setLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            
            // setSingle 제약
            setSingle.topAnchor.constraint(equalTo: setLabel.bottomAnchor, constant: 11),
            setSingle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 23),
            
            // setCookie 제약
            setCookie.topAnchor.constraint(equalTo: setLabel.bottomAnchor, constant: 11),
            setCookie.leadingAnchor.constraint(equalTo: setSingle.leadingAnchor, constant: 23),
            setCookie.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
           
            // cookieLabel 제약
            cookieLabel.topAnchor.constraint(equalTo: setLabel.bottomAnchor, constant: 51),
            cookieLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 23),
            cookieLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            // cookieCollectionView 제약
            cookieCollectionView.topAnchor.constraint(equalTo: cookieLabel.bottomAnchor, constant: 25),
            cookieCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cookieCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            cookieCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
        ])
        
        
        sauceCollectionView.delegate = self
        sauceCollectionView.dataSource = self
        cookieCollectionView.delegate = self
        cookieCollectionView.dataSource = self
        sauceCollectionView.register(SandwichButton.self, forCellWithReuseIdentifier: sauceButton.sandwichButtonID)
        cookieCollectionView.register(SandwichButton.self, forCellWithReuseIdentifier: cookieButton.sandwichButtonID)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentStep = .choiceSauceSet
    }
}

extension SauceViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == sauceCollectionView {
            return sauceStore.sauces.count
        }
        if collectionView == cookieCollectionView {
            return cookieStore.cookies.count
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == sauceCollectionView {
            let cell = sauceCollectionView.dequeueReusableCell(withReuseIdentifier: "SandwichButton", for: indexPath) as! SandwichButton
            
            cell.sandwichTitle = sauceStore.sauces[indexPath.row].korName
            cell.sandwichEngTitle = sauceStore.sauces[indexPath.row].engName
            if let cal = sauceStore.sauces[indexPath.row].cal {
                cell.sandwichCalTitle = String(cal) + "kcal"
            }
            return cell
            
        } else {
            let cell = cookieCollectionView.dequeueReusableCell(withReuseIdentifier: "SandwichButton", for: indexPath) as! SandwichButton
            cell.sandwichTitle = cookieStore.cookies[indexPath.row].korName
            cell.sandwichEngTitle = cookieStore.cookies[indexPath.row].engName
            
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
        navigationController?.pushViewController(OrderCompleteViewController(), animated: true)
    }
    
   
}

extension SauceViewController: ChoiceButtonProtocol {
    func didTapButton() {
        
        print("버튼 눌림")
    }
    
    
}
