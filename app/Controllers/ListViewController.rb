class ListViewController < UITableViewController
  attr_accessor :notes

  def reload
    @notes = Note.all.sort {|a,b| b.created_at <=> a.created_at}
    self.tableView.reloadData
  end

  def viewDidLoad
    self.title = "Notes"
  end

  def viewWillAppear animated
    reload
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @notes.count
  end

  CellID = 'Cell'
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    note = @notes[indexPath.row]
    cell = tableView.dequeueReusableCellWithIdentifier(CellID) || UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier: CellID)
    cell.textLabel.text = note.text.strip
    cell.detailTextLabel.text = note.created_at.to_s
    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    self.performSegueWithIdentifier("editNote", sender:indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated:true)
  end

  def tableView(tableView, commitEditingStyle:editingStyle, forRowAtIndexPath:indexPath)
    if editingStyle == UITableViewCellEditingStyleDelete
      note = @notes[indexPath.row]
      puts "delete #{note.text}"
      note.delete
      reload
    end
  end

  def prepareForSegue(segue, sender:indexPath) 
    noteVC = segue.destinationViewController
    case segue.identifier
    when 'addNote'
      noteVC.note = Note.new
    when 'editNote'
      noteVC.note = @notes[indexPath.row]
    end
  end

end
