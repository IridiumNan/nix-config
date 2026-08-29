{ pkgs, ... }:
{

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = [
    "C.UTF-8/UTF-8"
    "en_US.UTF-8/UTF-8"
    "zh_CN.UTF-8/UTF-8"
  ];

  i18n = {
   inputMethod = {
     enable = true;
     type = "fcitx5";
     fcitx5.addons = [
        pkgs.fcitx5-gtk
        pkgs.fcitx5-rime
        pkgs.qt6Packages.fcitx5-chinese-addons
        pkgs.rime-data
     ];
   };
  };
}
