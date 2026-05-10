{
	 xdg.portal = {
	 	enable = true;
    		config.common.default = "gtk";
    		extraPortals = [ "pkgs.xdg-desktop-portal-gtk" ];
  	};
#	xdg.portal.extraPortals = [ xdg-desktop-portal-gtk ];
	programs.dconf.enable = true;
}
