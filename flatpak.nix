{
services.flatpak = {
  enable = true;

  overrides = {
    global = {
      Context.filesystems = [
        "/nix/store:ro"
      ];
    };
  };
};
}
