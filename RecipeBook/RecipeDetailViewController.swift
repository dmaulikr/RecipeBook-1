import UIKit

class RecipeDetailViewController: UIViewController {
    
    private var _recipe: Recipe!
    
    @IBOutlet weak var recipeDetailName: UILabel!
    
    @IBOutlet weak var recipeDetailImage: UIImageView!
    
    @IBOutlet weak var recipeIngredientsList: UITextView!
    
    @IBOutlet weak var recipeDetailHowToPrepare: UITextView!
    
    @IBOutlet weak var timeToPrepareLabel: UILabel!
    
    var recipe: Recipe {
        get {
            return _recipe
        }
        set {
            _recipe = newValue
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        recipeDetailName.text = recipe.name
        recipeDetailImage.image = recipe.image

        var finalText = "Необходими съставки:\n"
        
        for item in recipe.ingredients {
            
            var text = ""
          
            for (_,value) in item {
                text += "\(value) "
            }
            text.remove(at: text.index(before: text.endIndex))
            finalText += "• \(text)\n"
            
        }
        
        
        recipeIngredientsList.text? = finalText
        var prepare = "Начин на приготвяне:\n"
        prepare += recipe.howToPrepare
        recipeDetailHowToPrepare.text? = prepare
        
        
        timeToPrepareLabel.text? = recipe.timeToPrepare
        
    }

    @IBAction func backToRecipesPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}




















