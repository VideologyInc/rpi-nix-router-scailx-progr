/** Include services and programs configuration */
{ inputs, ... }@flakeContext:
{ config, lib, pkgs, ... }: {
  config = {
    services = {
      ntp.enable = true;

      openssh = {
        enable = true;
        openFirewall = true;
        settings.PermitRootLogin = "yes";
        settings.PasswordAuthentication = false;
      };

      avahi = {
        enable = true;
        nssmdns = true;
        publish.enable = true;
        publish.addresses = true;
        publish.workstation = true;
      };

    };

    programs = {
      starship = {
        enable = true;
      };
      bash.shellAliases = {
        df = "df -h";
        ".." = "cd ..";
        cat = "bat --style=plain -P";
        ls = "exa --color=auto";
        # du = "dust -b";
        # neofetch = "macchina";
      };
    };

    # add docker
    virtualisation.docker.enable = true;
  };
}
