Just a simple FizzBuzz program in x86-64 assembly, inspired by [this tweet](https://x.com/ludwigABAP/status/1874547355988656307).

To run the program, you need to have `nasm` and `qemu` installed.

```bash
nasm -f macho64 fizzbuzz.asm -o fizzbuzz.o
ld -o fizzbuzz fizzbuzz.o -lSystem -L/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -macos_version_min 11.0
```

Then run the program from the terminal:

```bash
./build.sh
```
