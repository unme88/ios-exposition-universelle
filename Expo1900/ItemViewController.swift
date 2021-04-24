//
//  ItemViewController.swift
//  Expo1900
//
//  Created by Sunny on 2021/04/24.
//

import UIKit

class ItemViewController: UIViewController {
    
//    var textToSet: String?
//    var itemImage: UIImage?
//        var itemDescription: String?
    var koreanItem: KoreanItem?
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    //    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let detailedKoreanItem = koreanItem else {
            return
        }
        
        self.navigationItem.title = detailedKoreanItem.koreanTitle
        self.itemImageView.image = UIImage(named: detailedKoreanItem.englishTitle)
        self.textLabel.text = detailedKoreanItem.fullDescription
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        


            
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
