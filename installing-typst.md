# Installing Typst

**Outcome: a `typst` program on your machine, obtained from the project's own releases, with its integrity checked and its version known.**

## The shape of the install

Typst is one self-contained program. There is no installer wizard, no runtime to set up first, and nothing to configure afterwards: you fetch one archive, take the program out of it, and put it somewhere your shell can find it. The lab did exactly this (transcript t00).

## Step 1: get the archive

Releases live on the project's GitHub page, under **Releases**, one archive per platform. For a 64-bit Linux machine the file is named:

```text
typst-x86_64-unknown-linux-musl.tar.xz
```

The `musl` in the name is a technical detail about how the program was built; the practical meaning is that this build carries everything it needs and runs on any reasonably current Linux. There are builds for Windows and for Macs, and for ARM machines (a Raspberry Pi wants the `aarch64` one). The lab's archive was 17,462,992 bytes for version 0.15.1.

## Step 2: check it before you trust it

Any program you download is worth a checksum. The lab recorded the archive's SHA-256:

```bash
sha256sum typst-x86_64-unknown-linux-musl.tar.xz
```

```text
a6d077d0a95eed5a2eba715b2dae06be954f624ccbf85758a03f389ded33118c
```

That is the checksum of the 0.15.1 archive as downloaded by the lab. If you download the same version and your sum differs, stop: the file is incomplete or not the file the project published. (Checksums are version-specific — a different version has a different sum, and that is expected.)

## Step 3: unpack and place

```bash
tar -xJf typst-x86_64-unknown-linux-musl.tar.xz
```

Inside the folder is a single `typst` program. Either run it from there, or copy it to a folder on your `PATH` — `~/.local/bin` is the usual home for one personal program:

```bash
mkdir -p ~/.local/bin
cp typst-x86_64-unknown-linux-musl/typst ~/.local/bin/
```

## Step 4: prove it

```bash
typst --version
```

```text
typst 0.15.1 (9dfd3a08)
```

The number in brackets is the exact build. If the shell answers "command not found", the program is not on your `PATH` — see the troubleshooting chapter.

## The other ways in

The lab used the release archive because it is the route it could verify end to end. The project's documentation describes others, which this guide names without having run them:

- **Package managers.** Many Linux distributions and Homebrew carry a `typst` package. Convenient, and the version may lag the releases page.
- **Cargo.** If you already live in the Rust world, `cargo install --locked typst-cli` builds it from source — slow, and you need the toolchain.
- **The web editor.** typst.app needs nothing installed at all; it is a different way of working, described in chapter 13, not a way of installing the compiler.

## Keeping it current

Typst releases arrive regularly and the language is still growing, so a document that compiles under one version may warn under the next — chapter 10 met a command that version 0.15.1 already calls deprecated. `typst update` upgrades the release-archive install in place. Whatever route you chose, note your version in the document's first comment if the document matters; future you will be grateful.
