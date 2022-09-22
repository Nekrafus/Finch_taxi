////
////  MainUI.swift
////  FinchProject
////
////  Created by Vladimir Pulkhrov on 09.03.2022.
////
//
//import UIKit
//
//protocol MainViewInput: AnyObject {  }
//
//final class MainViewController: UIViewController {
//
//    // MARK: - Public properties
//
//    var presenter: loginViewOutput?
//
//    var fromDestinations = [1,2,3,4,5,6,7,8,9,10]
//    var toDestinations = [1,2,3,4,5,6,7,8,9,10]
//
//    private let whereToGoLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Where to go?"
//        label.numberOfLines = 1
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont(descriptor: UIFontDescriptor.init(name: "SFProDisplay-Thin", size: 33), size: 33)
//        return label
//    }()
//
//    private var destinationView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .red
//        return view
//    }()
//
//    private let findTransferButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("findTransfer", for: .normal)
//        button.setTitleColor(UIColor.black, for: .normal)
//        button.titleLabel?.font = UIFont(name: "SFProDisplay-Regular", size: 17)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.backgroundColor = .lightGray
//        button.layer.cornerRadius = 15
//        button.addTarget(self, action: #selector(showOptions), for: UIControl.Event.touchUpInside)
//        return button
//    }()
//
//
//
//    // MARK: - Collection View
//
//    enum Section: Int, CaseIterable {
//        case fromWhere
//        case whereToGo
//
//        var columnCount: Int {
//            switch self {
//            case .fromWhere:
//                return 1
//           case .whereToGo:
//               return 1
//           }
//        }
//    }
//
//    var dataSource: UICollectionViewDiffableDataSource<Section, Int>! = nil
//    var collectionView: UICollectionView! = nil
//
//
//
//    // MARK: - Life cycle
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        drawSelf()
//        presenter?.viewIsReady()
//    }
//
//    @objc private func showOptions() {
//
//    }
//
//
//    // MARK: - Drawning
//
//    private func drawSelf() {
//
//        view.addSubview(findTransferButton)
//        setupFindTransferButton()
//
//        view.addSubview(destinationView)
//        setupDestinationView()
//        configureHierarchy()
//        configureDataSource()
//        destinationView.addSubview(collectionView)
//
//        view.addSubview(whereToGoLabel)
//        setupWhereToGoLabel()
//    }
//    private func setupWhereToGoLabel() {
//        NSLayoutConstraint.activate([
//            whereToGoLabel.bottomAnchor.constraint(equalTo: destinationView.topAnchor, constant: -60),
//            whereToGoLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25)
//        ])
//    }
//
//    private func setupDestinationView() {
//        NSLayoutConstraint.activate([
//            destinationView.bottomAnchor.constraint(equalTo: findTransferButton.topAnchor, constant: -60),
//            destinationView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
//            destinationView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
//            destinationView.heightAnchor.constraint(equalToConstant: 300)
//        ])
//    }
//
//    private func setupFindTransferButton() {
//        NSLayoutConstraint.activate([
//            findTransferButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70),
//            findTransferButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
//            findTransferButton.widthAnchor.constraint(equalToConstant: 120)
//        ])
//    }
//
//    private func createLayout() -> UICollectionViewLayout {
//        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
//
//            guard let sectionKind = Section(rawValue: sectionIndex) else { return nil }
//            let columns = sectionKind.columnCount
//
//            let itemSize = NSCollectionLayoutSize(
//                widthDimension: .fractionalWidth(1),
//                heightDimension: .fractionalHeight(1))
//            let item = NSCollectionLayoutItem(layoutSize: itemSize)
//            item.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)
//
//            let groupHeight = columns == 1 ?
//            NSCollectionLayoutDimension.absolute(50) :
//            NSCollectionLayoutDimension.fractionalWidth(1)
//
//            let groupSize = NSCollectionLayoutSize(
//                widthDimension: .fractionalWidth(0.4),
//                heightDimension: groupHeight)
//            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: columns)
//
//            let section = NSCollectionLayoutSection(group: group)
//            section.contentInsets = .init(top: 10, leading: 0, bottom: 0, trailing: 10)
//            section.orthogonalScrollingBehavior = .continuous
//            return section
//        }
//        return layout
//    }
//
//    private func configureHierarchy() {
//        collectionView = UICollectionView(frame: destinationView.bounds, collectionViewLayout: createLayout())
//        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        collectionView.backgroundColor = .systemBackground
//
//        collectionView.register(DestinationCell.self, forCellWithReuseIdentifier: DestinationCell.reuseIdentifier)
//        view.addSubview(collectionView)
//    }
//
//    private func configureDataSource() {
//        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView) {
//            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Int) -> UICollectionViewCell? in
//
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DestinationCell.reuseIdentifier, for: indexPath) as? DestinationCell else { fatalError("Cannot create the cell")
//
//            }
//
//            // cell.fill(address: "11111")
//
//            return cell
//        }
//
//        let itemsPerSection = 10
//        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
//        Section.allCases.forEach {
//            snapshot.appendSections([$0])
//            let itemOffset = $0.rawValue * itemsPerSection
//            let itemUpperbound = itemOffset + itemsPerSection
//            snapshot.appendItems(Array(itemOffset..<itemUpperbound))
//            dataSource.apply(snapshot, animatingDifferences: false)
//        }
//    }
//
//
//    private func setupProfileAvatarImageView() {
//        NSLayoutConstraint.activate([
//
//        ])
//    }
//
//    private func setupPhoneLabel() {
//        NSLayoutConstraint.activate([
//
//        ])
//    }
//
//}
//
//
//// MARK: - loginViewInput
//extension MainViewController: loginViewInput {
//
//}
