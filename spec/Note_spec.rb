def assert_equal expected, got
  expected.should == got
end

describe "Note" do
  def new_note text
    Note.new(:text=>text, :created_at=> Time.now).save
  end
  before do
    NanoStore.shared_store = NanoStore.store
    new_note("a")
    new_note("b")
    new_note("c")
  end
  after do
    NanoStore.shared_store = nil
  end

  it "count" do
    notes = Note.all
    assert_equal(3, notes.count)
  end
end
