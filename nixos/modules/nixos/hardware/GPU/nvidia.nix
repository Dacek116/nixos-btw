{ config, lib, pkgs, ... }:

let
  cfg = config.nvidia;
in {
  options.nvidia.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable NVIDIA drivers and configuration";
  };

  config = lib.mkIf cfg.enable {

    nixpkgs.config.nvidia.acceptLicense = true;

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    hardware.nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true;
      open = false;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
    };

    services.xserver = {
      enable = true;
      videoDrivers = [ "nvidia" ];
    };

    environment.sessionVariables = {
      # Zmień na "x11" jeśli nie używasz Waylanda
      XDG_SESSION_TYPE = "wayland";
  
      # Ustawienie backendu GBM na nvidia-drm
      GBM_BACKEND = "nvidia-drm";
  
      # GLX vendor library na nvidia (przy dedykowanym GPU)
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  
      # VAAPI dla NVIDIA (akceleracja video)
      LIBVA_DRIVER_NAME = "nvidia";
  
      # G-Sync i VRR (Variable Refresh Rate)
      __GL_GSYNC_ALLOWED = "1";
      __GL_VRR_ALLOWED = "1";

      # Set NVD backend to direct for NVIDIA video decoding.
      # env = NVD_BACKEND, direct

      # Disable atomic modesetting as a workaround for NVIDIA driver issues. (DEDICATED GPU)
      #env = WLR_DRM_NO_ATOMIC = "1"; 

      # Limit the maximum number of frames allowed to be queued by the GPU.
      # env = __GL_MaxFramesAllowed, "1";

      # Enable PRIME render offload for hybrid graphics setups. (HYBRID GPU)
      # env = __NV_PRIME_RENDER_OFFLOAD = "1";

      # Specify Vulkan layer for NVIDIA Optimus. (HYBRID GPU)
      # env = __VK_LAYER_NV_optimus = "NVIDIA_only";

    };
  };
}
