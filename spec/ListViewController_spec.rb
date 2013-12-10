def assert_equal expected, got
  expected.should == got
end

describe "ListViewController" do
  tests ListViewController, :storyboard => 'NanoStore', :id => 'ListViewController'
  it "check class" do
    nav = UIApplication.sharedApplication.delegate.window.rootViewController
    list = nav.topViewController 
    assert_equal(UINavigationController, nav.class)
    assert_equal(ListViewController, list.class)
    assert_equal(UITableView, list.tableView.class)
    assert_equal(Array, list.notes.class)
    assert_equal(0, list.notes.count)
  end
end
