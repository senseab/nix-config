let
  locale = "zh_CN.UTF-8";
in
{
  i18n.defaultLocale = locale;
  #i18n.extraLocaleSettings.LC_ADDRESS = locale;
  #i18n.extraLocaleSettings.LC_IDENTIFICATION = locale;
  #i18n.extraLocaleSettings.LC_MEASUREMENT = locale;
  #i18n.extraLocaleSettings.LC_MONETARY = locale;
  #i18n.extraLocaleSettings.LC_NAME = locale;
  #i18n.extraLocaleSettings.LC_NUMERIC = locale;
  #i18n.extraLocaleSettings.LC_PAPER = locale;
  #i18n.extraLocaleSettings.LC_TELEPHONE = locale;
  #i18n.extraLocaleSettings.LC_TIME = locale;
}
