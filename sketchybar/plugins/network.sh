#!/bin/sh

# Source colors
source "$HOME/.config/sketchybar/colors.sh"

# Function to detect active network interface
get_active_interface() {
  # Try different methods to find active network interface
  if command -v route >/dev/null 2>&1; then
    # Linux/macOS route command
    route get default 2>/dev/null | grep interface | awk '{print $NF}' | head -1
  elif command -v ip >/dev/null 2>&1; then
    # Linux ip command
    ip route show default 2>/dev/null | grep -oP 'dev \K\w+' | head -1
  else
    # Fallback: check common interface names
    for iface in en0 eth0 wlan0 wifi0; do
      if ifconfig "$iface" 2>/dev/null | grep -q "inet "; then
        echo "$iface"
        return
      fi
    done
  fi
}

# Function to check internet connectivity
check_connectivity() {
  # Try multiple methods to check connectivity
  if command -v ping >/dev/null 2>&1; then
    ping -c 1 -W 3 1.1.1.1 >/dev/null 2>&1 || ping -c 1 -W 3 1.0.0.1 >/dev/null 2>&1
  elif command -v curl >/dev/null 2>&1; then
    curl -s --max-time 3 http://www.google.com >/dev/null 2>&1
  elif command -v wget >/dev/null 2>&1; then
    wget -q --timeout=3 --spider http://www.google.com >/dev/null 2>&1
  else
    # Fallback: check if any network interface has an IP
    ifconfig 2>/dev/null | grep -q "inet.*broadcast" || ip addr 2>/dev/null | grep -q "inet.*brd"
  fi
}

# Function to detect VPN connection
detect_vpn() {
  local vpn_interface=""
  local vpn_type=""
  
  # Check for VPN interfaces
  for iface in $(ifconfig 2>/dev/null | grep "^[a-z]" | cut -d: -f1 | grep -E "(utun|tun|ppp|tap|wg)" | head -5); do
    if ifconfig "$iface" 2>/dev/null | grep -q "inet "; then
      vpn_interface="$iface"
      break
    fi
  done
  
  # Determine VPN type based on interface name
  if [ -n "$vpn_interface" ]; then
    case "$vpn_interface" in
      utun*) vpn_type="IPSec/IKEv2" ;;
      tun*) vpn_type="OpenVPN/Tunnel" ;;
      ppp*) vpn_type="PPP VPN" ;;
      tap*) vpn_type="TAP VPN" ;;
      wg*) vpn_type="WireGuard" ;;
      *) vpn_type="VPN" ;;
    esac
    echo "$vpn_type"
    return 0
  fi
  
  # Check for common VPN processes
  if pgrep -f "openvpn\|wireguard\|pptp\|l2tp\|sstp" >/dev/null 2>&1; then
    echo "VPN"
    return 0
  fi
  
  # Check macOS VPN status using scutil
  if command -v scutil >/dev/null 2>&1; then
    if scutil --nc list 2>/dev/null | grep -q "Connected"; then
      echo "VPN"
      return 0
    fi
  fi
  
  return 1
}

# Function to get WiFi network name
get_wifi_name() {
  local iface="$1"
  
  # Try macOS networksetup command
  if command -v networksetup >/dev/null 2>&1; then
    local wifi_info=$(networksetup -getairportnetwork "$iface" 2>/dev/null)
    if echo "$wifi_info" | grep -v "You are not associated" | grep -q "Current Wi-Fi Network:"; then
      echo "$wifi_info" | cut -d':' -f2 | sed 's/^ *//'
      return 0
    fi
  fi
  
  # Try iwgetid (Linux)
  if command -v iwgetid >/dev/null 2>&1; then
    iwgetid -r "$iface" 2>/dev/null
    return $?
  fi
  
  # Try iwconfig (Linux)
  if command -v iwconfig >/dev/null 2>&1; then
    iwconfig "$iface" 2>/dev/null | grep 'ESSID:' | cut -d'"' -f2
    return $?
  fi
  
  return 1
}

# Function to check if interface is WiFi
is_wifi_interface() {
  local iface="$1"
  # Common WiFi interface patterns
  case "$iface" in
    wlan*|wifi*|en0|wlp*) return 0 ;;
    *) 
      # Check if interface has wireless capabilities
      if [ -d "/sys/class/net/$iface/wireless" ]; then
        return 0
      fi
      ;;
  esac
  return 1
}

# Main logic
if check_connectivity; then
  ACTIVE_IFACE=$(get_active_interface)
  VPN_STATUS=$(detect_vpn)
  
  if [ -n "$VPN_STATUS" ]; then
    # VPN is active - show VPN status with underlying connection
    if [ -n "$ACTIVE_IFACE" ] && is_wifi_interface "$ACTIVE_IFACE"; then
      WIFI_NAME=$(get_wifi_name "$ACTIVE_IFACE")
      if [ -n "$WIFI_NAME" ]; then
        ICON="󰖂"  # VPN + WiFi icon
        LABEL="$VPN_STATUS + $WIFI_NAME"
      else
        ICON="󰖂"
        LABEL="$VPN_STATUS + WiFi"
      fi
    else
      ICON="󰖂"  # VPN + Ethernet icon
      LABEL="$VPN_STATUS + Ethernet"
    fi
    COLOR=$WARNING_COLOR  # Use warning color for VPN to make it noticeable
  elif [ -n "$ACTIVE_IFACE" ] && is_wifi_interface "$ACTIVE_IFACE"; then
    # WiFi connection without VPN
    WIFI_NAME=$(get_wifi_name "$ACTIVE_IFACE")
    if [ -n "$WIFI_NAME" ]; then
      ICON="󰖩"
      LABEL="$WIFI_NAME"
      COLOR=$SUCCESS_COLOR
    else
      ICON="󰖩"
      LABEL="WiFi"
      COLOR=$SUCCESS_COLOR
    fi
  else
    # Wired/Ethernet connection without VPN
    ICON="󰈀"
    LABEL="Ethernet"
    COLOR=$SUCCESS_COLOR
  fi
else
  # No connectivity
  ICON="󰌙"
  LABEL="Offline"
  COLOR=$ERROR_COLOR
fi

# Update the network item
sketchybar --set "$NAME" \
           icon="$ICON" \
           icon.color="$COLOR" \
           label="$LABEL" \
           label.color="$COLOR"