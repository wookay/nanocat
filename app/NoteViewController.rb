class NoteViewController < UIViewController
  attr_accessor :note
  def viewDidLoad
    @textView = view.viewWithTag 3
    @textView.text = @note.text
    @textView.becomeFirstResponder
  end

  def viewWillDisappear animated
    if @note.text != @textView.text
      if "" == @textView.text
        @note.delete
      else
        @note.text = @textView.text
        @note.created_at = Time.now
        @note.save
      end
    end
  end

end
