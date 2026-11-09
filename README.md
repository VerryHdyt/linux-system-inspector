# Linux System Inspector

A lightweight, read-only command-line tool for inspecting essential Linux system information. It is written in Bash and uses standard Linux interfaces and utilities.

## Features

- **Host:** hostname, OS release, kernel, architecture, and uptime.
- **CPU:** processor model, logical CPU count, and 1/5/15-minute load averages.
- **Memory:** RAM total, used, available, and swap usage.
- **Disk:** mounted filesystem capacity and usage.
- **Processes:** top 10 processes sorted by CPU usage.
- **Network:** interfaces and IP addresses using `ip` (or `ifconfig` as fallback).
- **Read-only:** the inspection commands do not change system configuration.
- **Low dependency footprint:** Bash plus common Linux utilities.

## Requirements

- Linux with readable `/proc` filesystem.
- Bash 4+ recommended.
- `df`, `ps`, `hostname`, and `uname` for the corresponding sections.
- `iproute2` (`ip`) or `net-tools` (`ifconfig`) for network inspection.
- Root access is not required for normal use.

## Quick start

Clone the repository:

```bash
git clone https://github.com/VerryHdyt/linux-system-inspector.git
cd linux-system-inspector
```

Run directly with Bash:

```bash
bash bin/linux-system-inspector
bash bin/linux-system-inspector memory
bash bin/linux-system-inspector disk
```

Install system-wide:

```bash
sudo make install
linux-system-inspector
linux-system-inspector processes
```

The default install location is `/usr/local/bin`. Override it with `make install PREFIX=/custom/path`.

## Commands

| Command | Description |
| --- | --- |
| `summary` | Host, CPU, memory, and disk overview (default) |
| `host` | Host and operating-system details |
| `cpu` | CPU model, logical cores, and load averages |
| `memory` | RAM and swap usage |
| `disk` | Mounted filesystem usage |
| `processes` | Top 10 processes by CPU usage |
| `network` | Network interfaces and addresses |
| `all` | Every available inspection section |
| `help` | Usage information |
| `version` | Version information |

Examples:

```bash
linux-system-inspector
linux-system-inspector cpu
linux-system-inspector all
```

## Development

Run the smoke tests:

```bash
make test
```

Check Bash syntax:

```bash
make check
```

The GitHub Actions workflow runs syntax checks and CLI smoke tests on pushes and pull requests targeting `main`.

## Project structure

```text
linux-system-inspector/
├── .github/
│   └── workflows/
│       └── ci.yml
├── bin/
│   └── linux-system-inspector
├── tests/
│   └── test_cli.sh
├── Makefile
└── README.md
```

## Limitations

- This initial release targets Linux; it is not intended for macOS or BSD.
- Some process or network details may be hidden by permissions or container isolation.
- Disk output depends on the host's `df` implementation.
- The tool currently provides human-readable output only; JSON output is planned.

## Roadmap

- [x] Host and kernel information
- [x] CPU and load average inspection
- [x] RAM and swap inspection
- [x] Filesystem usage
- [x] Process overview
- [x] Network interface overview
- [x] CLI help and version commands
- [x] Smoke tests and GitHub Actions CI
- [ ] Machine-readable JSON output
- [ ] Configurable process sorting and result limits
- [ ] Release packaging

## Contributing

Issues and pull requests are welcome. Keep changes focused, test behavior changes, and document platform-specific limitations. Do not add commands that modify the host without clearly separating them from read-only inspection features.

## Security

The tool is designed for local inspection and does not intentionally modify system state. Review scripts before running them, especially when installing software with elevated privileges.

## License

No license has been added yet. All rights remain with the copyright holder.
