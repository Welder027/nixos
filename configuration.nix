# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./byedpi.nix
      ./dns.nix
#      ./portal.nix
      ./automation.nix
#      ./vbox.nix
      ./transmission.nix
      ./nvim.nix
      ./minidlna.nix
#      ./tlp.nix
#      ./samba.nix
      ./gvfs.nix
      ./flatpak.nix
      ./doas.nix
#      ./fonts.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages =  pkgs.linuxPackages_xanmod;
  boot.zswap.enable = true;

  networking.hostName = "nixos"; # Define your hostname.
  virtualisation.libvirtd.enable = true;

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
#  services.dbus.implementation = “dbus”

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
  i18n.defaultLocale = "ru_RU.UTF-8";
#  console = {
#     font = "cyr-sun16";
     #keyMap = "ruwin_alt_sh-UTF-8";
#   };

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  #services.xserver.displayManager.gdm.enable = true;
#  services.displayManager.gdm.enable = true;
  services.displayManager.sddm = {
  enable = true;
  theme = "catppuccin-mocha-mauve";
  package = pkgs.kdePackages.sddm;
};

  #services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
#  hardware.bluetooth.enable = true;
  hardware.graphics.enable32Bit = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
#    hardware.bluetooth.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.void = {
    isNormalUser = true;
    description = "void";
    extraGroups = [ "networkmanager" "wheel" "transmission" "libvirtd" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Instalr firefox.
#  programs.firefox-esr.enable = true;

  programs.niri.enable = true;
  hardware.bluetooth.enable = true;
#  programs.neovim.defaultEditor = true;
#  programs.neovim.enable = true;

  services.udisks2.enable = true;
#  hardware.bluetooth.enable = true;
  programs.fish.enable = true;
#  programs.dconf.enable = true;
  #programs.steam.enable = true;
  #programs.noctalia-shell.enable = true;

#  services.flatpak.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
#  lxappearance
		xdg-desktop-portal-gtk
		papirus-icon-theme
		adw-gtk3
		nwg-look
		catppuccin-cursors.mochaGreen
		(magnetic-catppuccin-gtk.override {
			accent = [ "green" ];
		})
		#catppuccin-sddm

  (
  pkgs.catppuccin-sddm.override {
    flavor = "mocha";
    accent = "mauve";
    font  = "Hasklug Nerd Font Mono";
    fontSize = "11";
    #background = "${./wallpaper.png}";
    loginBackground = true;
  }
)

  noctalia-shell
  doas-sudo-shim
  wtype
  vlc
  qemu
  virt-manager
  file-roller
  steam-run-free
  openal-soft
  geeqie
  vimPlugins.LazyVim
  gcc
  tldr
  cargo
  rustc
  freecad
  cura-appimage
#  bottles
  #lutris
  #bazarr
  wine-wayland
  mindustry-wayland
  #brave
  niri
  pywalfox-native
  noctalia-qs
 # alacritty
  kitty
  udiskie
  #fuzzel
  #neovim
  xwayland-satellite
  firefox-esr
  nautilus
  #tokyonight-gtk-theme
  git
  swaylock
  lsd
  bat
  zoxide
  fastfetch
  fzf
  superfile
  btop
  cassette
  ripgrep
  pokemon-colorscripts
  transmission-remote-gtk
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  wget
  curl
  winetricks
  zenity
  ];
  ################
  xdg.portal = {
    		enable = true;
    		config.common.default = "gtk";
    		extraPortals = [
			pkgs.xdg-desktop-portal-gtk
		];
  	};

	programs.dconf.enable = true;


	###########
  fonts.packages = with pkgs; [
  nerd-fonts.hasklug
  nerd-fonts.fira-code
  inter
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
