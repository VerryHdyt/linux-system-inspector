# Linux System Inspector

A lightweight, terminal-based system inspection toolkit for Linux. The goal of this project is to make essential system information easy to inspect from a single, scriptable command-line interface.

> **Project status:** Documentation and initial project setup. The implementation is under development; commands described in the roadmap are planned, not yet available.

## Goals

- Provide a clear snapshot of Linux host and operating-system information.
- Inspect CPU, memory, storage, uptime, and running processes.
- Keep output readable in a terminal and suitable for shell scripting.
- Avoid unnecessary dependencies and keep the tool lightweight.
- Support common Linux distributions where the required system interfaces are available.

## Planned capabilities

| Area | Planned information |
| --- | --- |
| Host | Hostname, kernel, architecture, uptime |
| CPU | Model, logical core count, load averages |
| Memory | Total, used, available, and swap |
| Storage | Mounted filesystems, capacity, and usage |
| Processes | Top processes by CPU and memory usage |
| Network | Interfaces, addresses, and basic link statistics |

The exact command interface and supported platforms will be documented as implementation progresses.

## Design principles

1. **Read-only by default** — inspection must not modify system configuration.
2. **Least privilege** — do not require root unless a future feature clearly needs it.
3. **Portable where practical** — prefer standard Linux interfaces such as `/proc`, `/sys`, and common userland utilities.
4. **Safe output** — handle unavailable fields and permission errors without crashing.
5. **Script-friendly** — provide a machine-readable output format when the core interface is established.

## Repository layout

The project structure will evolve with the implementation. The intended layout is:

```text
linux-system-inspector/
├── README.md
├── src/
├── tests/
├── docs/
└── LICENSE
```

## Getting started

There is no runnable release yet. Once the first implementation is available, this section will include installation instructions, dependencies, and example commands.

## Development roadmap

- [ ] Choose the implementation language and CLI interface.
- [ ] Add host and kernel information collection.
- [ ] Add CPU and memory inspection.
- [ ] Add filesystem and storage reporting.
- [ ] Add process summaries.
- [ ] Add unit tests and error-handling tests.
- [ ] Add JSON output and usage examples.
- [ ] Document supported distributions and release packaging.

## Contributing

Issues and focused contributions are welcome. Before opening a pull request:

1. Keep changes small and focused.
2. Add or update tests for behavior changes.
3. Document new options and platform limitations.
4. Ensure inspection commands remain read-only unless explicitly documented otherwise.

## Security

This tool is intended for local system inspection. Do not run untrusted builds with elevated privileges. Please report security concerns privately to the repository owner rather than publishing sensitive details in an issue.

## License

No license has been added yet. Until a license is included in the repository, all rights are reserved by the copyright holder.
