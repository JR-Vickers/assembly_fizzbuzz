# Install dependencies first:
# brew install nasm qemu x86_64-elf-gcc

# Compile the assembly code
nasm -f macho64 fizzbuzz.asm -o fizzbuzz.o

# Link the object file (using macOS format)
ld -o fizzbuzz fizzbuzz.o -lSystem -L/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -macos_version_min 11.0

# Run (just ./fizzbuzz since we're building native macOS binary)
./fizzbuzz