class AppDelegate
  attr_accessor :window
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    NanoStore.shared_store = NanoStore.store(:file, App.documents_path + "/nano.db")
    storyboard = UIStoryboard.storyboardWithName("NanoStore", bundle:nil)
    nav = storyboard.instantiateViewControllerWithIdentifier("Nav")
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = nav
    @window.makeKeyAndVisible
    true
  end
end
