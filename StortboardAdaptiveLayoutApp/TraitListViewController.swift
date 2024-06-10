//
//  TraitListViewController.swift
//  StortboardAdaptiveLayoutApp
//
//  Created by racoon on 6/10/24.
//

import UIKit

class TraitListViewController: UIViewController {

    @IBOutlet weak var traitsTableView: UITableView!
    
    var ListItem: [TableViewItem] = []
    
    
    func updateListItem () {
        ListItem.removeAll()
        
        ListItem.append(contentsOf: [
            TableViewItem(title: "Horizontall Size Class", value: traitCollection.horizontalSizeClass.description),
            TableViewItem(title: "Vertical Size Class", value: traitCollection.verticalSizeClass.description),
        ])
        traitsTableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateListItem()
    }
}

extension TraitListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
          
        cell.textLabel!.text = ListItem[indexPath.row].title
        cell.detailTextLabel!.text = ListItem[indexPath.row].value
              
          return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ListItem.count
    }
}

extension UIUserInterfaceSizeClass: CustomStringConvertible {
    public var description: String {
        switch self {
        case .unspecified:
            return "unspecified"
        case .compact:
            return "compact"
        case .regular:
            return "regular"
        default:
            return ""
        }
    }
}
