import UIKit

class ViewController: UIViewController {
    var alphabet = [Character]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initAlphabet()
        print(alphabet)
    }
    
    
    /**
        Initialize array of characters from the English alphabet
    */
    func initAlphabet () {
        alphabet = (97...122).map({Character(UnicodeScalar($0))})
    }
}
