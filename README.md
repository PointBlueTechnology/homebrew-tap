# Point Blue Technology Homebrew tap

```bash
brew install pointbluetechnology/tap/fdiag
```

## fdiag

`fdiag` reads, writes, validates, converts and renders flow diagrams and sequence diagrams: FlowDiagram's
`.flow` text format, Sequence Diagram for Mac's `.msd`, and Mermaid sequence diagrams. It renders SVG, PNG,
PDF and OmniGraffle documents, and `fdiag mcp` runs an MCP server so AI agents can work with diagrams.

```bash
fdiag outline checkout.flow        # numbered, plain-language reading of every diagram
fdiag validate checkout.flow       # errors with line numbers
fdiag render checkout.flow -o checkout.svg
fdiag convert legacy.msd -o legacy.flow
fdiag reference                    # .flow syntax guide
```

To give Claude Code the MCP tools:

```bash
claude mcp add --scope user flowdiagram -- fdiag mcp
```

Requires macOS 26 or later. Binaries are signed with a Developer ID and notarized by Apple; they're attached
to this repository's releases.
