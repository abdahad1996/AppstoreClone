//
import UIKit
import SDWebImage
class SearchResultCell: UICollectionViewCell {
    
    var appResult: Result! {
        didSet {
            nameLabel.text = appResult.trackName
            categoryLabel.text = appResult.primaryGenreName
            ratingsLabel.text = "Rating: \(appResult.averageUserRating ?? 0)"
            let url = URL(string: appResult.artworkUrl100)
            appIconImageView.sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
            appIconImageView.sd_setImage(with: url)
            
            screenshot1ImageView.sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
            screenshot1ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[0]))

            if appResult.screenshotUrls.count > 1 {
                screenshot2ImageView.sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
                screenshot2ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[1]))
            }
            
            if appResult.screenshotUrls.count > 2 {
                screenshot3ImageView.sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
                screenshot3ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[2]))
            }
        }
    }
  
    
    let appIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "APP NAME"
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos & Video"
        return label
    }()
    
    let ratingsLabel: UILabel = {
        let label = UILabel()
        label.text = "9.26M"
        return label
    }()
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.layer.cornerRadius = 16
        return button
    }()
    
    lazy var screenshot1ImageView = self.createScreenshotImageView()
    lazy var screenshot2ImageView = self.createScreenshotImageView()
    lazy var screenshot3ImageView = self.createScreenshotImageView()
    
    func createScreenshotImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
    // this is a designated initializer and must always call the superclass designated initalizer
    // a convenience initialzer calls a designated initialzer of the same class
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // optional
        //we gave width and height to appicon and getbutton hence they will not resize ! the vertical stackview will resize to fit inside the horizontal stackview.
        //
        
        let infoTopStackView = UIStackView(arrangedSubviews: [
            appIconImageView,
            VerticalStackView(arrangedSubviews: [
                nameLabel, categoryLabel, ratingsLabel
                ]),
            getButton

            ])
        infoTopStackView.spacing = 12
        infoTopStackView.alignment = .center
        // allgnment if its trailing will be top and leading will be bottom for horizontal
        // alignment will be trailing for vertical and leading for vertical if trailong and leading respectively
        
        let screenshotsStackView = UIStackView(arrangedSubviews: [screenshot1ImageView, screenshot2ImageView, screenshot3ImageView])
        screenshotsStackView.spacing = 12
        screenshotsStackView.distribution = .fillEqually

        let overallStackView = VerticalStackView(arrangedSubviews: [
            infoTopStackView, screenshotsStackView], spacing: 16)
        
       
            
        
        
            
//
      
        addSubview(overallStackView)
        overallStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
