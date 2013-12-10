NanoStore sample with RubyMotion

	$ rake
	$ rake spec
	$ rake spec files=Note
	$ rake device


# Note
	(main)> Note.all
	(main)> list = UIApplication.sharedApplication.delegate.window.rootViewController.topViewController
	(main)> list.notes
	(main)> list.reload
