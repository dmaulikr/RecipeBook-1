import UIKit

class RecipeCell: UITableViewCell {

    @IBOutlet weak var dishImage: UIImageView!
    
    @IBOutlet weak var dishName: UILabel!
    
    @IBOutlet weak var timeToPrepare: UILabel!
    
    @IBOutlet weak var recipeImage: UIImageView!
    
    @IBOutlet weak var starButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func updateCellInformation(recipe: Recipe) {
        dishImage.image = recipe.image
        dishName.text = recipe.name
        timeToPrepare.text = recipe.timeToPrepare
        recipeImage.layer.cornerRadius = 10.0
        recipeImage.clipsToBounds = true
        
        recipeImage.layer.borderWidth = 1.0
    }
    
    @IBAction func starPressed(_ sender: UIButton) {
        
        let starIconImg = UIImage(named: "starIcon")
        let starFilledImg = UIImage(named: "starIconFilled")
        
        if starButton.imageView?.image == UIImage(named: "starIcon"){
            sender.setImage(starFilledImg, for: .normal)
        }
        else{
            sender.setImage(starIconImg, for: .normal)
        }
        
        
    }
    
}
