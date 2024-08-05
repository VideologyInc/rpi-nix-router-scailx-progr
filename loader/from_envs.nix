let
  pkgs = import <nixpkgs> {};
  scailx_progr = import ../scailx_progr.nix;
  getOrElse = x: d: if x == "" then d else x;
  getIfNotNullElse = x: d: if x == null then d else x;
  getAsList = x: if x == "" then [] else [x];

  parseBool = val: if val == "true" then true else false;

  # variables
  hostname_env = builtins.getEnv "INPUT_HOSTNAME";
  hostname_default = "rpi_holden";
  hostname = getOrElse hostname_env hostname_default;

  username_env = builtins.getEnv "INPUT_USERNAME";
  username_default = "woile";
  username = getOrElse username_env username_default;

  timezone_env = builtins.getEnv "INPUT_TIME_ZONE";
  timezone_default = "Europe/Amsterdam";
  timezone = getOrElse timezone_env timezone_default;

  raspberry_model_env = builtins.getEnv "INPUT_RASPBERRY_MODEL";
  raspberry_model_default = "4";
  raspberry_model = pkgs.lib.strings.toInt (getOrElse raspberry_model_env raspberry_model_default);

  ssh_key_env = builtins.getEnv "INPUT_SSH_KEY";
  ssh_key = getAsList ssh_key_env;

  wifi_enabled_env = builtins.getEnv "INPUT_WIFI_ENABLED";
  wifi_enabled_default = true;
  wifi_enabled = getOrElse (parseBool wifi_enabled_env) wifi_enabled_default;

  wifi_network_name_env = builtins.getEnv "INPUT_WIFI_NETWORK_NAME";
  wifi_network_name_default = "";
  wifi_network_name = getOrElse wifi_network_name_env wifi_network_name_default;

  wifi_network_psk_env = builtins.getEnv "INPUT_WIFI_NETWORK_PSK";
  wifi_network_psk_default = "";
  wifi_network_psk = getOrElse wifi_network_psk_env wifi_network_psk_default;

 in {
  hostname = getIfNotNullElse scailx_progr.hostname hostname;
  username = getIfNotNullElse scailx_progr.username username;
  timezone = getIfNotNullElse scailx_progr.timezone timezone;
  raspberry_model = getIfNotNullElse scailx_progr.raspberry_model raspberry_model;
  ssh_key = scailx_progr.ssh_key ++ ssh_key;
  wifi_enabled = getIfNotNullElse scailx_progr.wifi_enabled wifi_enabled;
  wifi_network_name = getIfNotNullElse scailx_progr.wifi_network_name wifi_network_name;
  wifi_network_psk = getIfNotNullElse scailx_progr.wifi_network_psk wifi_network_psk;
 }