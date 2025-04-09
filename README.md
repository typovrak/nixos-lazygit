# nixos-lazygit

nixos-lazygit = fetchGit {
	url = "https://github.com/typovrak/nixos-lazygit.git";
	ref = "main";
};

(import "${nixos-lazygit}/configuration.nix")
