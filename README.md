# 🫆 NixOS Lazygit

> Declarative NixOS module to install Lazygit, scaffold per-user configuration and enforce secure permissions.

## 📦 Features

- 🔒 **Secure config directory :** Creates ```~/.config/lazygit``` with ```700``` permissions and correct ownership.

- 📋 **Config deployment :** Installs your ```config.yml``` into ```~/.config/lazygit/config.yml``` with ```600``` permissions.

- ⚙️ **LazyGit package :** Ensures ```lazygit``` is available in ```environment.systemPackages```.

- 🔄 **Idempotent :** Cleans and recreates the config folder on each rebuild without destroying existing data.

- 💾 **Backup guidance :** Documentation includes commands to back up any existing Lazygit config before applying changes.

## ⚙️ Prerequisites

### 1. NixOS version
Requires NixOS 24.11 or newer.

### 2. User validation
the target user must be defined in ```config.username```. See [typovrak main nixos configuration](https://github.com/typovrak/nixos) for more details.

### 3. Backup
Before proceeding, back up existing configuration if needed
```bash
cp ~/.config/lazygit{,.bak}
```

## 🚀 Installation
Fetch the module directly in your main nixos configuration at ```/etc/nixos/configuration.nix``` using fetchGit
```nix
# /etc/nixos/configuration.nix

let
  nixos-lazygit = fetchGit {
    url = "https://github.com/typovrak/nixos-lazygit.git";
    ref = "main";
    rev = "b863a0a498b981b99bfb41c674de44ec027c4ea5"; # update to the desired commit
  };
in
{
  imports = [
    /etc/nixos/hardware-configuration.nix # system hardware settings
    /etc/nixos/variables.nix # defines config.username and other variables, see https://github.com/typovrak/nixos for more details
    (import "${nixos-lazygit}/configuration.nix")
  ];
}
```

Once imported, rebuild your system to apply changes
```bash
sudo nixos-rebuild switch
```

## 🎬 Usage

The ```lazygit``` command will launch a TUI git interface.

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.  
You can also support me on ☕ [Buy me a coffee](https://www.buymeacoffee.com/typovrak).

## 📝 License

Distributed under the [MIT license](LICENSE.md).

## 📜 Code of conduct

This project maintains a [code of conduct](.github/CODE_OF_CONDUCT.md) to ensure a respectful, inclusive and constructive community.

## 🛡️ Security

To report vulnerabilities or learn about supported versions and response timelines, please see our [security policy](.github/SECURITY.md).

---

<p align="center"><i>Made with 💜 by typovrak</i></p>
