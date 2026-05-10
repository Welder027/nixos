{
system.autoUpgrade = {
  enable = true;
  allowReboot = false;
  dates = "*-*-* 21:30:00";
  #dates = "weekly";
  randomizedDelaySec = "10min";
  persistent = true;
};

nix.gc = {
  automatic = true;
  dates = "weekly";
  options = "--delete-older-than 30d";
};
}
