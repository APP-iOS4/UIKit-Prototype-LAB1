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
        
        // 스택뷰 여백
        let spacer1: UIView = {
            let spacer = UIView()
            spacer.isUserInteractionEnabled = false
            spacer.setContentHuggingPriority(.fittingSizeLevel, for: .vertical)
            spacer.setContentCompressionResistancePriority(.fittingSizeLevel, for: .vertical)
            return spacer
        }()
        
        // 스택뷰 여백
        let spacer2: UIView = {
            let spacer = UIView()
            spacer.isUserInteractionEnabled = false
            spacer.setContentHuggingPriority(.fittingSizeLevel, for: .vertical)
            spacer.setContentCompressionResistancePriority(.fittingSizeLevel, for: .vertical)
            return spacer
        }()
        
        
        let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.distribution = .equalSpacing
            stackView.alignment = .center
            stackView.spacing = 0
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
        let bottomBarView: UIView = {
            let view = UIView()
            view.backgroundColor = .init(named: "mainOrange")
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        let morningLabel: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 30, weight: .regular)
            label.textColor = .white
            label.text = "아침메뉴"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()

        let sandwichLabel: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 30, weight: .bold)
            label.textColor = .init(named: "mainOrange")
            label.text = "샌드위치"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()

        let saladLabel: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 30, weight: .regular)
            label.textColor = .white
            label.text = "샐러드"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()

        let wrapLabel: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 30, weight: .regular)
            label.textColor = .white
            label.text = "랩/기타"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()

        let eventLabel: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 30, weight: .regular)
            label.textColor = .white
            label.text = "행사"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()       
        
        let sideLabel: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 30, weight: .regular)
            label.textColor = .white
            label.text = "사이드/음료"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()

        

        
        sandwichCollectionView = {
            let collectionViewLayout = UICollectionViewFlowLayout()
            collectionViewLayout.scrollDirection = .vertical
            collectionViewLayout.minimumLineSpacing = 40
            collectionViewLayout.minimumInteritemSpacing = 40
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.register(SandwichButton.self, forCellWithReuseIdentifier: SandwichButton.sandwichButtonID)
            return collectionView
        }()
        
        sandwichCollectionView.backgroundColor = .systemGray6
        self.view.addSubview(sandwichCollectionView)
        customNavigationBar.addSubview(stackView)
        customNavigationBar.addSubview(bottomBarView)
        
        stackView.addArrangedSubview(spacer1)
        stackView.addArrangedSubview(morningLabel)
        stackView.addArrangedSubview(sandwichLabel)
        stackView.addArrangedSubview(saladLabel)
        stackView.addArrangedSubview(wrapLabel)
        stackView.addArrangedSubview(eventLabel)
        stackView.addArrangedSubview(sideLabel)
        stackView.addArrangedSubview(spacer2)
        
        sandwichCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sandwichCollectionView.topAnchor.constraint(equalTo: customNavigationBar.bottomAnchor, constant: 40),
            sandwichCollectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            sandwichCollectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            sandwichCollectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: customNavigationBar.homeButton.trailingAnchor),
            stackView.trailingAnchor.constraint(equalTo: customNavigationBar.rightButton.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: customNavigationBar.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: customNavigationBar.bottomAnchor),
            
            bottomBarView.leadingAnchor.constraint(equalTo: sandwichLabel.leadingAnchor),
            bottomBarView.trailingAnchor.constraint(equalTo: sandwichLabel.trailingAnchor),
            bottomBarView.bottomAnchor.constraint(equalTo: customNavigationBar.bottomAnchor),
            bottomBarView.heightAnchor.constraint(equalToConstant: 10)
        ])
        
        sandwichCollectionView.delegate = self
        sandwichCollectionView.dataSource = self
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// MARK: 델리게이트, 데이터소스

extension SandwichViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(sandwichStore.sandwiches.count)
        return sandwichStore.sandwiches.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sandwichCollectionView.dequeueReusableCell(withReuseIdentifier: SandwichButton.sandwichButtonID, for: indexPath) as! SandwichButton
        
        if indexPath.row < 9 {
            cell.thumbnailView.thumbnailImageView.image = UIImage(named: "m0" + String(indexPath.row + 1))
        } else {
            cell.thumbnailView.thumbnailImageView.image = UIImage(named: "m" + String(indexPath.row + 1))
        }
        
        cell.sandwichTitle = sandwichStore.sandwiches[indexPath.row].korName

        cell.sandwichEngTitle = sandwichStore.sandwiches[indexPath.row].engName
        if let cal = sandwichStore.sandwiches[indexPath.row].cal {
            cell.sandwichCalTitle = String(cal) + "kcal"
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewSize: CGSize = collectionView.frame.size
        let cellWidth: CGFloat = (collectionViewSize.width - 200) / 4
        let cellHeight: CGFloat = ThumbnailView.getDummyHeight(cellWidth, isHighlightTitle: true)
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let cell = sandwichCollectionView.cellForItem(at: indexPath) as! SandwichButton
//        cell.isSelect.toggle()
        navigationController?.pushViewController(ChoiceBreadViewController(), animated: true)
        
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
    }
}
