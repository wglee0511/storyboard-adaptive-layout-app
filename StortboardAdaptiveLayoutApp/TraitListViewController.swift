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
            TableViewItem(title: "Display Scale", value: "\(traitCollection.displayScale)"),
            TableViewItem(title: "Display Gamut", value: "\(traitCollection.displayGamut)"),
            TableViewItem(title: "User Interface Style", value: "\(traitCollection.userInterfaceStyle)"),
            TableViewItem(title: "User Interface Idiom", value: "\(traitCollection.userInterfaceIdiom)"),
        ])
        traitsTableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateListItem()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
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


extension UIDisplayGamut: CustomStringConvertible {
    public var description: String {
        switch self {
        case .P3:
            return "P3"
        case .SRGB:
            return "SRGB"
        case .unspecified:
            return "unspecified"
        default:
            return ""
        }
    }
}

extension UIUserInterfaceStyle: CustomStringConvertible {
    public var description: String {
        switch self {
        case .dark:
            return "dark"
        case .light:
            return "light"
        case .unspecified:
            return "unspecified"
        default:
            return ""
        }
    }
}

extension UIUserInterfaceIdiom: CustomStringConvertible {
    public var description: String {
        switch self {
        case .carPlay:
            return "carPlay"
        case .mac:
            return "mac"
        case .pad:
            return "pad"
        case .phone:
            return "phone"
        case .tv:
            return "tv"
        case .unspecified:
            return "unspecified"
        case .vision:
            return "vision"
        default:
            return ""
        }
    }
}

