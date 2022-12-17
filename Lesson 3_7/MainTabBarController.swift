
import Foundation
import UIKit

class MainTabController:
    UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.layer.borderWidth = 3
        tabBar.layer.borderColor = UIColor.red.cgColor
    }
}
