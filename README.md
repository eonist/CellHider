# CellHider 🙈
Hide cells in UITableView

### Installation:
- SPM: `.package(url: "https://github.com/passbook/CellHider.git", .branch("master"))`


### Note:

```swift
extension TableView {
   /**
    * On cell-tap
    */
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      CellHider.hide(table: self, indexPaths: [indexPath], isHidden: true) // hides cells you click
   }
   /**
    * Returns the height of each cell
    * - Note: we have to set height to zero when hiding cells
    */
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      let cell = self.subviews.compactMap { $0 as? UITableViewCell }.first { self.indexPath(for: $0) == indexPath } // this is the only way to get access to cell during creation
      return cell?.isHidden ?? false ? CGFloat.leastNonzeroMagnitude : 60 // or use UITable.automatic...
   }
}
```
