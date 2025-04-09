{ config, pkgs, ... }:

let
	username = "typovrak";
	group = config.users.users.${username}.group or "users";
	home = config.users.users.${username}.home;
in {
	system.activationScripts.lazygit = ''
		mkdir -p ${home}/.config
		chown ${username}:${group} ${home}/.config
		chmod 700 ${home}/.config

		rm -rf ${home}/.config/lazygit
		mkdir ${home}/.config/lazygit
		chown ${username}:${group} ${home}/.config/lazygit
		chmod 700 ${home}/.config/lazygit

		cp ${./config.yml} ${home}/.config/lazygit/config.yml
		chown ${username}:${group} ${home}/.config/lazygit/config.yml
		chmod 600 ${home}/.config/lazygit/config.yml
	'';
	
	environment.systemPackages = with pkgs; [
		lazygit
	];
}
