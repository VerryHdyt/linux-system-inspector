#!/usr/bin/env bash
set -Eeuo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CLI="$ROOT/bin/linux-system-inspector"
fail() { printf 'FAIL: %s\n' "$*" >&2; exit 1; }
pass() { printf 'PASS: %s\n' "$*"; }

help_output="$(bash "$CLI" help)" || fail "help command failed"
grep -q 'Usage:' <<<"$help_output" || fail "help output missing Usage"
pass "help output"

version_output="$(bash "$CLI" version)" || fail "version command failed"
grep -q '0.2.0' <<<"$version_output" || fail "version output incorrect"
pass "version output"

host_output="$(bash "$CLI" host)" || fail "host command failed"
grep -q 'Hostname:' <<<"$host_output" || fail "host output missing hostname"
pass "host inspection"

cpu_output="$(bash "$CLI" cpu)" || fail "cpu command failed"
grep -q 'Logical CPUs:' <<<"$cpu_output" || fail "cpu output missing logical CPU count"
pass "CPU inspection"

memory_output="$(bash "$CLI" memory)" || fail "memory command failed"
grep -q 'RAM total:' <<<"$memory_output" || fail "memory output missing RAM total"
pass "memory inspection"

disk_output="$(bash "$CLI" disk)" || fail "disk command failed"
grep -q 'FILESYSTEMS' <<<"$disk_output" || fail "disk output missing heading"
pass "disk inspection"


plain_output="$(bash "$CLI" --plain memory)" || fail "plain memory command failed"
grep -q 'MEMORY' <<<"$plain_output" || fail "plain mode output missing MEMORY heading"
pass "plain mode"

no_anim_output="$(bash "$CLI" --no-anim host)" || fail "no-animation host command failed"
grep -q 'HOST' <<<"$no_anim_output" || fail "no-animation output missing HOST heading"
pass "animation opt-out"

if bash "$CLI" definitely-not-a-command >/dev/null 2>&1; then
  fail "unknown command should return non-zero"
fi
pass "unknown command validation"

printf '\nAll CLI smoke tests passed.\n'
