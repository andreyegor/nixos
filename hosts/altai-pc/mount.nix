{
  fileSystems."/mnt/Games" = {
    device = "/dev/disk/by-uuid/4ddef35f-ac14-4b64-b543-9cb9a2492c12";
    fsType = "ext4";
    options = [
      "defaults"
    ];
  };
  fileSystems."/mnt/Other" = {
    device = "/dev/disk/by-uuid/A6628B15628AE97F";
    fsType = "ntfs";
    options = [
      "defaults"
    ];
  };
}