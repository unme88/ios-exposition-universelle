//
//  SecondViewController.swift
//  Expo1900
//
//  Created by Sunny on 2021/04/14.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "cell"
    var koreanItems: [KoreanItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.topItem?.title = "메인"
        self.navigationItem.title = "한국의 출품작"
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else { return }
        
        do {
            self.koreanItems = try jsonDecoder.decode([KoreanItem].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }

        self.tableView.reloadData()
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.koreanItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        let item: KoreanItem = self.koreanItems[indexPath.row]
        cell.textLabel?.text = item.koreanTitle
        cell.imageView?.image = UIImage(named: item.englishTitle)
        cell.detailTextLabel?.text = item.shortDescription
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        guard let nextViewController: ItemViewController = segue.destination as? ItemViewController else {
            return
        }
        
//        guard let cell: UITableViewCell = sender as? UITableViewCell else {
//            return
//        }

//        nextViewController.textToSet = cell.textLabel?.text
//        nextViewController.itemImage = cell.imageView?.image
//        nextViewController.itemDescription = KoreanItem.fullDescription

        guard let rowNumber = tableView.indexPathForSelectedRow?.row else {
            return
        }
        
        nextViewController.koreanItem = koreanItems[rowNumber]
//        nextViewController.textLabel.text = koreanItems[rowNumber].fullDescription
        
    }
}
