//
//  JoinSurfView.swift
//  TestTask
//
//  Created by Yana Dudareva on 12.02.2023.
//

import UIKit

class JoinSurfView: UIView {
    
    // MARK: - Private Properties
    
    private let panRecognier = UIPanGestureRecognizer()
    private var animator = UIViewPropertyAnimator()
    private var isOpen = false
    private var animationProgress: CGFloat = 0
    private var closedTransform = CGAffineTransform.identity
    
    // MARK: - Public Properties

    let viewManager: JoinSurfViewManagerProtocol = JoinSurfViewManager()
    
    // MARK: - Constants

    private enum Constants {
        
        static let offsetIndent: CGFloat = 20
        static let insetIndent: CGFloat = -20
        
        static let cornerRadius: CGFloat = 32
        
        static let heightOfDrawerView: CGFloat = 0.53
        static let heightOfFooter: CGFloat = 150
        
        static let backgroundImage: String = "backgroundImage"
        
        enum CollectionView {
            static let size: CGSize = CGSize(width: 96, height: 44)
            static let edgeInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
        
        enum StackView {
            static let spacing: CGFloat = 12
            static let topIndent: CGFloat = 24
            static let height: CGFloat = 160
            static let heightNext: CGFloat = 152
        }
    }
    
    // MARK: - Background Image
    
    private lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: Constants.backgroundImage)
        return image
    }()
    
    // MARK: - DrawerView
    
    private lazy var drawerView: DrawerView = {
        let view = DrawerView()
        view.backgroundColor = .white
        view.cornerRadius = Constants.cornerRadius
        return view
    }()
    
    private lazy var footerOfDrawerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    // MARK: - Labels
    
    private let titleLabel = TextView()
    private let descriptionCaruselLabel = TextView()
    private let descriptionNextCaruselLabel = TextView()
    
    // MARK: - CollectionViews
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = Constants.CollectionView.size
        layout.sectionInset = Constants.CollectionView.edgeInsets
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(JoinSurfJobCell.self, forCellWithReuseIdentifier: JoinSurfJobCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var collectionViewNext: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = Constants.CollectionView.size
        layout.sectionInset = Constants.CollectionView.edgeInsets
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(JoinSurfJobCell.self, forCellWithReuseIdentifier: JoinSurfJobCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    // MARK: - StacksView
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = Constants.StackView.spacing
        return stackView
    }()
    
    private lazy var stackViewNext: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = Constants.StackView.spacing
        return stackView
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods

    private func initialSetup() {
        setDelegates()
        configureSubviews()
        makeConstraints()
    }
    
    private func setDelegates() {
        collectionView.delegate = viewManager as? UICollectionViewDelegate
        collectionView.dataSource = viewManager as? UICollectionViewDataSource
        
        collectionViewNext.delegate = viewManager as? UICollectionViewDelegate
        collectionViewNext.dataSource = viewManager as? UICollectionViewDataSource
    }
    
    private func configureSubviews() {
        addSubviewsToStackViews()
    
        drawerView.addSubviews([ stackView,
                                 stackViewNext
                               ])
        
        addSubviews([ backgroundImage,
                           drawerView,
                           footerOfDrawerView
                         ])
    }
    
    private func addSubviewsToStackViews() {
        stackView.addArrangedSubviews([ titleLabel,
                                        descriptionCaruselLabel,
                                        collectionView
                                      ])
        
        stackViewNext.addArrangedSubviews([ descriptionNextCaruselLabel,
                                            collectionViewNext
                                          ])
    }
    
    private func makeConstraints() {
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        backgroundImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                            constant: Constants.offsetIndent).isActive = true
        
        descriptionCaruselLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionCaruselLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                         constant: Constants.offsetIndent).isActive = true
        descriptionCaruselLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                          constant: Constants.insetIndent).isActive = true
        
        descriptionNextCaruselLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionNextCaruselLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                             constant: Constants.offsetIndent).isActive = true
        descriptionNextCaruselLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                              constant: Constants.insetIndent).isActive = true
        
        drawerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            drawerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            drawerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            drawerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            drawerView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        footerOfDrawerView.translatesAutoresizingMaskIntoConstraints = false
        footerOfDrawerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        footerOfDrawerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        footerOfDrawerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        footerOfDrawerView.heightAnchor.constraint(equalToConstant: Constants.heightOfFooter).isActive = true
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: drawerView.topAnchor,
                                           constant: Constants.StackView.topIndent),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: Constants.StackView.height)
        ])
        
        NSLayoutConstraint.activate([
            stackViewNext.topAnchor.constraint(equalTo: stackView.bottomAnchor,
                                               constant: Constants.StackView.topIndent),
            stackViewNext.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackViewNext.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackViewNext.heightAnchor.constraint(equalToConstant: Constants.StackView.heightNext)
        ])
        
        collectionViewNext.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionViewNext.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    }
    
    private func startAnimationIfNeeded() {
        if animator.isRunning { return }
        let timingParameters = UISpringTimingParameters(dampingRatio: 1)
        animator = UIViewPropertyAnimator(duration: 0, timingParameters: timingParameters)
        animator.addAnimations {
            self.drawerView.transform = self.isOpen ? self.closedTransform : .identity
        }
        animator.addCompletion { position in
            if position == .end { self.isOpen.toggle() }
        }
        animator.startAnimation()
    }
    
    // MARK: - Public methods
    
    func setAnimation() {
        closedTransform = CGAffineTransform(translationX: 0, y: bounds.height * Constants.heightOfDrawerView)
        drawerView.transform = closedTransform
        
        panRecognier.addTarget(self, action: #selector(panned))
        drawerView.addGestureRecognizer(panRecognier)
    }
    
    func configure(model: JoinSurfModel) {
        titleLabel.configure(with: model.titleLabel)
        descriptionCaruselLabel.configure(with: model.descriptionCaruselLabel)
        descriptionNextCaruselLabel.configure(with: model.descriptionNextCaruselLabel)
    }
    
    func addJobs(jobs: [JoinSurfJobsModel]) {
        viewManager.setJobsArray(jobModels: jobs)
    }
    
    // MARK: - Actions
    
    @objc private func panned(recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            startAnimationIfNeeded()
            animator.pauseAnimation()
            animationProgress = animator.fractionComplete
        case .changed:
            var fraction = -recognizer.translation(in: drawerView).y / closedTransform.ty
            if isOpen { fraction *= -1 }
            if animator.isReversed { fraction *= -1 }
            animator.fractionComplete = fraction + animationProgress
            // todo: rubberbanding
        case .ended, .cancelled:
            let yVelocity = recognizer.velocity(in: drawerView).y
            let shouldClose = yVelocity > 0 // todo: should use projection instead
            if yVelocity == 0 {
                animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
                break
            }
            if isOpen {
                if !shouldClose && !animator.isReversed { animator.isReversed.toggle() }
                if shouldClose && animator.isReversed { animator.isReversed.toggle() }
            } else {
                if shouldClose && !animator.isReversed { animator.isReversed.toggle() }
                if !shouldClose && animator.isReversed { animator.isReversed.toggle() }
            }
            let fractionRemaining = 1 - animator.fractionComplete
            let distanceRemaining = fractionRemaining * closedTransform.ty
            if distanceRemaining == 0 {
                animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
                break
            }
            let relativeVelocity = min(abs(yVelocity) / distanceRemaining, 30)
            let timingParameters = UISpringTimingParameters(dampingRatio: 0.8, initialVelocity: CGVector(dx: relativeVelocity, dy: relativeVelocity))
            let preferredDuration = UIViewPropertyAnimator(duration: 0, timingParameters: timingParameters).duration
            let durationFactor = CGFloat(preferredDuration / animator.duration)
            animator.continueAnimation(withTimingParameters: timingParameters, durationFactor: durationFactor)
        default: break
        }
    }
}
