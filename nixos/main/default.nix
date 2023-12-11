{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];
  # enable systemd-boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # Enable kernel modules
  boot.extraModulePackages = [
    config.boot.kernelPackages.v4l2loopback.out
  ];
  boot.kernelModules = [ "kvm-intel" "hid-nintendo" "v4l2loopback" ];

  networking.hostName = "main-pc";
  # Network related stuff
  networking.networkmanager.enable = true;
  # Set your time zone.
  time.timeZone = "America/Fortaleza";


  # Select internationalisation properties.
  i18n.defaultLocale = "pt_BR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };
  # Logtech stuff
  services.ratbagd.enable = true;
  environment.systemPackages = with pkgs; [

    libratbag
  ];
  users.users.lin = {
    isNormalUser = true;
    initialPassword = "test";
    description = "lin";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
  };

  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;



  # Nvidia stuff
  hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;
    open = false;

    # Enable the Nvidia settings menu,
    # accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };


  programs.zsh.enable = true;


  # Sound stuff
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };



  # Allow unfree packages


  services.xserver.videoDrivers = [ "nvidia" ];
  # TODO: Comment here
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };



  services.openssh.enable = true;
  # Pin the default version of the nixos
  system.stateVersion = "23.11";

}
