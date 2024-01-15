{ lib, config, ... }:
{
  sound.enable = true;

  services.pipewire.enable = true;
  services.pipewire.pulse.enable = true;
  services.pipewire.alsa.enable = true;
  services.pipewire.alsa.support32Bit = true;

  xdg.sounds.enable = true;

  security.rtkit.enable = lib.mkDefault config.services.pipewire.enable;
}
