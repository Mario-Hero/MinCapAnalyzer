#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <program>"
    exit 1
fi

PROGRAM_PATH=$1

# List of capabilities to test
CAPABILITIES=(
  "cap_chown"
  "cap_dac_override"
  "cap_dac_read_search"
  "cap_fowner"
  "cap_fsetid"
  "cap_kill"
  "cap_setgid"
  "cap_setuid"
  "cap_setpcap"
  "cap_linux_immutable"
  "cap_net_bind_service"
  "cap_net_broadcast"
  "cap_net_admin"
  "cap_net_raw"
  "cap_ipc_lock"
  "cap_ipc_owner"
  "cap_sys_module"
  "cap_sys_rawio"
  "cap_sys_chroot"
  "cap_sys_ptrace"
  "cap_sys_pacct"
  "cap_sys_admin"
  "cap_sys_boot"
  "cap_sys_nice"
  "cap_sys_resource"
  "cap_sys_time"
  "cap_sys_tty_config"
  "cap_mknod"
  "cap_lease"
  "cap_audit_write"
  "cap_audit_control"
  "cap_setfcap"
  "cap_mac_override"
  "cap_mac_admin"
  "cap_syslog"
  "cap_wake_alarm"
  "cap_block_suspend"
  "cap_audit_read"
)

# Array to store required capabilities
required_caps=()

# Test each capability one by one
for cap in "${CAPABILITIES[@]}"; do
  echo "Testing without capability: $cap"
  
  if capsh --drop=$cap -- -c "$PROGRAM_PATH"; then
    echo "Program ran successfully without $cap"
  else
    echo "Program failed without $cap"
    required_caps+=($cap)
  fi
done

# Output the required capabilities
echo -e "\nMinimum required capabilities:"
for cap in "${required_caps[@]}"; do
  echo $cap
done
