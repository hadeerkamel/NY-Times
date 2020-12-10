//
//  ArticleDetailsView.swift
//  NY-Times
//
//  Created by Hadeer Kamel on 12/10/20.
//

import UIKit
import ImageSlideshow
import Kingfisher
class ArticleDetailsView: UIView {

    //MARK: - Properties -
    var data: ArticleViewModel?{
        didSet{
            setupUIData()
        }
    }
    //MARK: - Life cycle -
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setupViews()
    }
    //MARK: - setupUIData -
    func setupUIData(){
        guard let data = data else {return}
        
        titleLabel.text = data.title
        dateLabel.text = data.publishedDate
        authorLabel.text = data.byLine
        sourceLabel.text = data.source
        
        var images: [KingfisherSource] = []
        for image in data.images {
            if let source = KingfisherSource(urlString: image){
                images.append(source )}
        }
        itemImagesSlideShow.setImageInputs(images)
        itemImagesSlideShow.pageIndicator?.numberOfPages = images.count
    }
    //MARK: - SetupViews -
    private func setupViews(){
        
        addSubview(detailsStack)
        detailsStack.anchor( leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 0, left: 15, bottom: 40, right: 15))
        
        detailsStack.addArrangedSubview(titleLabel)
        detailsStack.addArrangedSubview(authorLabel)
        detailsStack.addArrangedSubview(sourceDateStack)
        
        dateImageView.anchor(size: CGSize(width: 20, height: 20))
        
        dateStack.addArrangedSubview(dateImageView)
        dateStack.addArrangedSubview(dateLabel)
        
        sourceDateStack.addArrangedSubview(sourceLabel)
        sourceDateStack.addArrangedSubview(dateStack)
        
        
        addSubview(itemImagesSlideShow)
        itemImagesSlideShow.anchor(top: topAnchor, leading: leadingAnchor, bottom: detailsStack.topAnchor, trailing: trailingAnchor,padding: UIEdgeInsets(top: 0, left: 10, bottom: 20, right: 10) )
    }
    //MARK: - UI Components -
    
    var itemImagesSlideShow : ImageSlideshow = {
        let slideShow = ImageSlideshow()
        
        let pageIndicator = UIPageControl()
        pageIndicator.currentPageIndicatorTintColor = UIConstants.Colors.AppMainColor
        pageIndicator.pageIndicatorTintColor = .lightGray
        
        slideShow.pageIndicator = pageIndicator
        slideShow.contentScaleMode = .scaleAspectFill
        slideShow.pageIndicatorPosition = PageIndicatorPosition(horizontal: .center, vertical: .bottom)
        
        return slideShow
    }()
    
    private let detailsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 10
        return stack
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.text = "sdsdkjsjdlksdjlsdjsdsjdkkkkkkkkkkkklsdsjdlsdjlsjds"
        return label
    }()
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = label.font.withSize(13)
        label.text = "skjdskjdlsdjl"
        return label
    }()
    
    private let sourceDateStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 5
        return stack
    }()
    
    private let dateStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 5
        return stack
    }()
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = label.font.withSize(13)
        label.text = "1/1/2020"
        return label
    }()
    
    private let dateImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "baseline_calendar_today_white_18pt")
        imageView.tintColor = .lightGray
        return imageView
    }()
    
    private let sourceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = label.font.withSize(13)
        label.text = "AnyOne"
        return label
    }()
}
