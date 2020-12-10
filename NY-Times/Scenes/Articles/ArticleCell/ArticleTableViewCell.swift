//
//  ArticleTableViewCell.swift
//  NY-Times
//
//  Created by Hadeer Kamel on 12/10/20.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    static var Identifier = "ArticleTableViewCell"
    var data: ArticleViewModel? {
        didSet{
            setupUIData()
        }
    }
    //MARK: - Life cycle -
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        superview?.layoutSubviews()
        setupViews()
    }
    //MARK: - Setup UI Data -
    func setupUIData(){
        guard let data = data else {return}
        
        titleLabel.text = data.title
        dateLabel.text = data.publishedDate
        authorLabel.text = data.byLine
        
    }
    
    //MARK: - SetupViews -

    private func setupViews(){
        accessoryType = .disclosureIndicator
        
        contentView.addSubview(articleImageView)
        articleImageView.anchor(leading: contentView.leadingAnchor, padding: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0), size: CGSize(width: 50, height: 50), positionY: contentView.centerYAnchor)
        
        contentView.addSubview(detailsStack)
        detailsStack.anchor(top: contentView.topAnchor, leading: articleImageView.trailingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 5, left: 10, bottom: 15, right: 30))
        
        detailsStack.addArrangedSubview(titleLabel)
        detailsStack.addArrangedSubview(authorLabel)
        detailsStack.addArrangedSubview(dateStack)
        
        dateImageView.anchor(size: CGSize(width: 20, height: 20))
        
        dateStack.addArrangedSubview(dateImageView)
        dateStack.addArrangedSubview(dateLabel)

    }
    //MARK: - UIComponents -
    
    private let articleImageView: RoundedImageView = {
        let imageView = RoundedImageView(frame: .zero)
        imageView.backgroundColor = .gray
        return imageView
    }()
    
    private let detailsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 5
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
}
