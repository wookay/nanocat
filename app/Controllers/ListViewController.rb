class ListViewController < UITableViewController
  attr_accessor :notes

  def reload
    @notes = Note.all
    self.tableView.reloadData
  end

  def viewDidLoad
    @notes = Note.all
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @notes.count
  end

  CellID = 'Cell'
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    note = @notes[indexPath.row]
    cell = tableView.dequeueReusableCellWithIdentifier(CellID) || UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier: CellID)
    cell.textLabel.text = note.text
    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated:true)
  end

end
