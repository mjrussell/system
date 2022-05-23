{ config, pkgs, ... }: {
  system.defaults = {

    # file viewer settings
    finder = {
      AppleShowAllExtensions = true;
      FXEnableExtensionChangeWarning = true;
      _FXShowPosixPathInTitle = true;
    };

    # trackpad settings
#    trackpad = {
#      # silent clicking = 0, default = 1
#      ActuationStrength = 0;
#      # enable tap to click
#      Clicking = true;
#      # firmness level, 0 = lightest, 2 = heaviest
#      FirstClickThreshold = 1;
#      # firmness level for force touch
#      SecondClickThreshold = 1;
#      # don't allow positional right click
#      TrackpadRightClick = false;
#      # three finger drag for space switching
#      # TrackpadThreeFingerDrag = true;
#    };

    # dock settings
    dock = {
      # auto show and hide dock
      autohide = false;
      # remove delay for showing dock
      autohide-delay = "0.0";
      # how fast is the dock showing animation
      autohide-time-modifier = "1.0";
      tilesize = 40;
      static-only = false;
      showhidden = false;
      show-recents = false;
      show-process-indicators = true;
      orientation = "bottom";
      mru-spaces = false;
    };

    NSGlobalDomain = {
      "com.apple.sound.beep.feedback" = 0;
      "com.apple.sound.beep.volume" = "0.000";
      # allow key repeat
      ApplePressAndHoldEnabled = false;
      # delay before repeating keystrokes
      InitialKeyRepeat = 10;
      # delay between repeated keystrokes upon holding a key
      KeyRepeat = 2;
      AppleShowAllExtensions = true;
      AppleShowScrollBars = "Automatic";
    };
  };
}
