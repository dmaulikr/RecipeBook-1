import UIKit

enum Ingredients {
    case name, quantity
}

class Recipe {
    private var _name : String
    private var _ingredients : [[Ingredients: String]]
    private var _howToPrepare: String
    private var _image: UIImage
    private var _timeToPrepare: String
    private var _favourite: Bool
    private var _numberOfClicks: Int
    
    init(name:String, ingredients: [[Ingredients: String]], howToPrepare: String, image:UIImage, timeToPrepare: String, favourite: Bool, numberOfClicks: Int) {
        self._name = name
        self._ingredients = ingredients
        self._howToPrepare = howToPrepare
        self._image = image
        self._timeToPrepare = timeToPrepare
        self._favourite = favourite
        self._numberOfClicks = numberOfClicks
    }
    
    var name : String {
        return _name
    }
    
    var ingredients: [[Ingredients:String]] {
        return _ingredients
    }
    
    var howToPrepare: String {
        return _howToPrepare
    }
    
    var image: UIImage {
        return _image
    }
    
    var timeToPrepare: String {
        return _timeToPrepare
    }
    
    var favourite: Bool {
        return _favourite
    }
    
    var numberOfClicks: Int {
        get{
            return _numberOfClicks
        }
        set {
            _numberOfClicks = newValue
        }
    }
}



























