# NeoVim

- [Neovim for Newbs. FREE NEOVIM COURSE](https://www.youtube.com/watch?v=zHTeCSVAFNY&list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn) by typecraft - Chris' is a NeoVim master teacher
- [0 to LSP : Neovim RC From Scratch](https://www.youtube.com/watch?v=w7i4amO_zaE) by ThePrimeagen - Careful! Michael's "Neo of the Vim", so watch your criticism capacity :)

## Windows

### Treesitter

On Windows without MSVC, don't bother installing LLVM or MinGW, simply grab the self-contained https://ziglang.org distribution which comes with headers and libraries:

```cmd
choco install zig
```

There is also `winget install zig.zig` but it is broken, because symlinked `zig` has trouble finding its own libraries.
