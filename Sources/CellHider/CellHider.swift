import UIKit
/**
 * A helper class that helps to hide items in a section based tableview
 * - Important: ⚠️️ the cells must exist before calling these methods
 */
public class CellHider {
   /**
    * Set visibility for indicies
    * - Note: when you only need to "hide or show" something and not "hide and show" something
    * - Parameters:
    *   - table: The table that holds the cells
    *   - indexPaths: The row-index, column-index locations of the cells
    *   - isHidden: make cells hidden or shown
    * ## Examples:
    * hide(table: self, items: [], isHidden: true)
    */
   public static func hide(table: UITableViewAndDataSource, indexPaths: [IndexPath], isHidden: Bool) {
      let indexPathItems: [IndexPathItem] = indexPaths.map { ($0, isHidden) }
      hide(table: table, indexPathItems: indexPathItems)
   }
   /**
    * Set many indicies to visible / hidden
    * - Parameters:
    *   - table: The table that holds the cells
    *   - items: A way to group many arrays like: [([IndexPath], isHidden)]
    * ## Examples:
    * hide(table: self, items: [([], false), ([], true)])
    */
   public static func hide(table: UITableViewAndDataSource, items: IndexPathItems) {
      let indexPaths: [IndexPathItem] = items.flatMap { item in
         item.indexPaths.map { ($0, item.isHidden) }
      }
      hide(table: table, indexPathItems: indexPaths)
   }
   /**
    * Show / hide cells
    * - Parameters:
    *   - table: The table that holds the cells
    *   - indexPathItems a way to group items like: ([IndexPath], isHidden)
    */
   public static func hide(table: UITableViewAndDataSource, indexPathItems: [IndexPathItem]) {
      UIView.setAnimationsEnabled(false) // Animations don't look good when you hide and show etc
      indexPathItems.forEach {
         table.cellForRow(at: $0.indexPath)?.isHidden = $0.isHidden
      }
      table.beginUpdates() // If you use reloadCell, the animation is glitchy, also you then need to update rowData array etc
      table.endUpdates()
      UIView.setAnimationsEnabled(true)
   }
}
