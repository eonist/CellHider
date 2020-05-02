import UIKit

extension CellHider {
   public typealias IndexPathItem = (indexPath: IndexPath, isHidden: Bool)
   public typealias IndexPathItems = [(indexPaths: [IndexPath], isHidden: Bool)]
   public typealias UITableViewAndDataSource = UITableView & UITableViewDataSource
}
