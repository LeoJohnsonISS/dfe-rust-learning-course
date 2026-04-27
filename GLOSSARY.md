# Glossary

Plain-English definitions of every technical term used in this course, with links to deeper explanations. Use this as a quick reference whenever a session uses a word you haven't met before — and don't feel bad about checking it as often as you need. Real developers do.

Terms are grouped roughly by topic so related ideas sit together. If you're hunting for one, try `Ctrl+F` / `⌘F`.

---

## Languages and how they run

### Compiled language

A language whose programs are translated into machine code (the CPU's native instructions) **once, ahead of time**, by a tool called a **compiler**. The resulting file (a "binary" or "executable") runs directly on the hardware. Rust, C, C++, and Go are compiled.

Compilation makes programs much faster but adds a build step every time you change the code. *Read more:* [Compiled language — Wikipedia](https://en.wikipedia.org/wiki/Compiled_language).

### Interpreted language

A language whose programs are read and executed **one line at a time**, every time you run them, by another program called an **interpreter**. Python, Ruby, and (classically) JavaScript are interpreted.

Interpreted languages are quicker to start tinkering with but usually slower at runtime than compiled ones. *Read more:* [Interpreter (computing) — Wikipedia](https://en.wikipedia.org/wiki/Interpreter_(computing)).

### Compiler

The program that turns your source code into something a computer can run. For Rust, the compiler is called `rustc`. It also checks your program for errors before it produces a binary — most of Rust's safety guarantees come from these checks. *Read more:* [Compiler — Wikipedia](https://en.wikipedia.org/wiki/Compiler).

### Machine code

The raw numeric instructions a CPU actually executes (e.g. "add register 1 to register 2"). You almost never read or write it by hand; the compiler produces it for you. *Read more:* [Machine code — Wikipedia](https://en.wikipedia.org/wiki/Machine_code).

### Toolchain

The collection of tools you need to build and run programs in a language: compiler, linker, package manager, formatter, etc. Rust's toolchain is `rustup` (manager) + `rustc` (compiler) + `cargo` (everything else). *Read more:* [Toolchain — Wikipedia](https://en.wikipedia.org/wiki/Toolchain).

### Garbage collection (GC)

An automatic memory-cleanup system used by languages like Python, Java, and JavaScript. The runtime periodically pauses your program to find and free memory you're no longer using. Convenient, but it costs CPU time and adds unpredictable pauses. **Rust has no garbage collector** — its ownership system frees memory at exactly the right moment, with no runtime cost. *Read more:* [Garbage collection (computer science) — Wikipedia](https://en.wikipedia.org/wiki/Garbage_collection_(computer_science)).

### Global Interpreter Lock (GIL)

A locking mechanism in CPython (the standard Python interpreter) that prevents more than one thread from running Python code at the same time, even on a multi-core CPU. It's the reason Python is famously bad at CPU-bound multithreading. Rust has no equivalent. *Read more:* [Global interpreter lock — Wikipedia](https://en.wikipedia.org/wiki/Global_interpreter_lock).

---

## Variables, types, and memory

### Variable / binding

A named place to store a value. In Rust we more correctly say **binding** because by default a variable can't change once it's been set — you're binding the name to a value, not assigning to a mutable slot. *Read more:* [Variable (computer science) — Wikipedia](https://en.wikipedia.org/wiki/Variable_(computer_science)).

### Immutable

Cannot be changed after it's been created. In Rust, `let x = 5;` creates an *immutable* binding — try to write `x = 6;` and the compiler refuses. Immutability prevents a huge class of bugs in larger programs. *Read more:* [Immutable object — Wikipedia](https://en.wikipedia.org/wiki/Immutable_object).

### Mutable

Can be changed after it's been created. Rust requires you to explicitly opt in with the `mut` keyword: `let mut x = 5;` lets you later write `x = 6;`. The opt-in design makes the *exceptions* visible. *Read more:* [Rust Book — Variables and Mutability](https://doc.rust-lang.org/book/ch03-01-variables-and-mutability.html).

### Type / type system

A **type** classifies a value (e.g. "this is a 64-bit integer", "this is a string"). A **type system** is the set of rules the compiler uses to make sure you only do sensible things with each type — e.g. you can't add a string to an integer without an explicit conversion. *Read more:* [Type system — Wikipedia](https://en.wikipedia.org/wiki/Type_system).

### Type inference

The compiler working out the type of a value from context, so you don't have to spell it out. `let n = 42;` — Rust infers `n: i32`. *Read more:* [Type inference — Wikipedia](https://en.wikipedia.org/wiki/Type_inference).

### Statically typed

The compiler checks every type at compile time, before the program runs. Mismatches become errors. Rust, Java, C, Go, TypeScript are statically typed. *Read more:* [Type system — Static type checking — Wikipedia](https://en.wikipedia.org/wiki/Type_system#Static_type_checking).

### Dynamically typed

Types are checked while the program runs — variables can hold any type. Python, JavaScript (without TypeScript), Ruby are dynamic. Easier to start, easier to break. *Read more:* [Type system — Dynamic type checking — Wikipedia](https://en.wikipedia.org/wiki/Type_system#Dynamic_type_checking).

### Stack vs heap

Two different parts of memory a program uses while running.

- The **stack** is fast, fixed-size, and freed automatically when a function returns. Local values of known size go here.
- The **heap** is larger, slower, and you ask for memory explicitly. Things whose size isn't known at compile time (e.g. a `String` whose length depends on user input) go here.

Most languages hide this distinction. Rust shows it to you because being explicit about where a value lives is what lets the compiler guarantee memory safety with no garbage collector. *Read more:* [Stack-based memory allocation — Wikipedia](https://en.wikipedia.org/wiki/Stack-based_memory_allocation), [Memory management — Heap allocation](https://en.wikipedia.org/wiki/Memory_management#HEAP).

### Floating-point number (`f32`, `f64`)

A way of storing real numbers (with decimal points) using a small fixed amount of memory. `f64` is 64 bits and is the default in Rust; `f32` is 32 bits and faster on some hardware. They can't represent every real number exactly — `0.1 + 0.2 != 0.3` for famous reasons. *Read more:* [IEEE 754 floating point — Wikipedia](https://en.wikipedia.org/wiki/IEEE_754), [What every computer scientist should know about floating-point arithmetic](https://docs.oracle.com/cd/E19957-01/806-3568/ncg_goldberg.html).

### Integer overflow

When an arithmetic operation produces a result too large for the type holding it (e.g. adding 1 to the largest possible `u8`, which is 255). In debug builds, Rust panics; in release builds, it wraps around. Either way, Rust forces you to be aware of it. *Read more:* [Integer overflow — Wikipedia](https://en.wikipedia.org/wiki/Integer_overflow).

### Shadowing

Re-declaring a name with a new `let` so the old value is hidden by a new one (possibly of a different type). Different from mutation — the old value is gone, not modified. *Read more:* [Variable shadowing — Wikipedia](https://en.wikipedia.org/wiki/Variable_shadowing).

---

## Rust-specific concepts

### Ownership

Rust's central memory rule: every value has a single owner (a variable). When the owner goes out of scope, the value is dropped (memory freed). This is how Rust is memory-safe with no garbage collector. *Read more:* [Rust Book — What is Ownership?](https://doc.rust-lang.org/book/ch04-01-what-is-ownership.html).

### Borrow / borrowing / borrow checker

Instead of giving away ownership, you can let other code **borrow** a value temporarily, with `&value` (read-only) or `&mut value` (read-write). The compiler component called the **borrow checker** enforces the rules: at any moment, you can have either many readers OR one writer, never both. *Read more:* [Rust Book — References and Borrowing](https://doc.rust-lang.org/book/ch04-02-references-and-borrowing.html).

### Reference

A pointer (memory address) plus the compiler's promise that the thing it points to is still valid. `&` makes a shared reference, `&mut` an exclusive one. *Read more:* [Rust Reference — References](https://doc.rust-lang.org/reference/types/pointer.html#shared-references-).

### Lifetime

A region of code during which a reference is valid. Most of the time the compiler works lifetimes out for you; occasionally you have to spell them out using names like `'a`. *Read more:* [Rust Book — Validating References with Lifetimes](https://doc.rust-lang.org/book/ch10-03-lifetime-syntax.html).

### Trait

A description of behaviour — a set of methods a type must provide to "implement" the trait. Similar to interfaces in Java/C# or protocols in Swift, but more powerful. `Iterator`, `Display`, and `Debug` are built-in traits. *Read more:* [Rust Book — Traits](https://doc.rust-lang.org/book/ch10-02-traits.html).

### Generic / generics

Code parameterised over types — e.g. `Vec<T>` is a vector of *some* type `T`, and the same code works for `Vec<i32>`, `Vec<String>`, etc. Compiles to a separate fast version for each concrete type used. *Read more:* [Rust Book — Generic Data Types](https://doc.rust-lang.org/book/ch10-01-syntax.html).

### Macro

Code that writes other code at compile time. You can spot macros in Rust because they end with `!` — `println!`, `vec!`, `format!`. *Read more:* [Rust Book — Macros](https://doc.rust-lang.org/book/ch19-06-macros.html).

### Crate

A Rust package. Crates can be **binary** (produce an executable) or **library** (code other crates can use). Cargo is the tool for managing crates. *Read more:* [Rust Book — Packages and Crates](https://doc.rust-lang.org/book/ch07-01-packages-and-crates.html).

### Cargo

Rust's official build tool, package manager, and test runner. Every command in this course that starts with `cargo` is talking to it. *Read more:* [The Cargo Book](https://doc.rust-lang.org/cargo/).

### Enum

A type whose values are one of a fixed set of named variants — and in Rust each variant can carry its own data. Powerful for modelling "this could be one of several different things". *Read more:* [Rust Book — Enums and Pattern Matching](https://doc.rust-lang.org/book/ch06-00-enums.html).

### Struct

A type that groups several named fields together — e.g. a `Point { x: f64, y: f64 }`. *Read more:* [Rust Book — Using Structs](https://doc.rust-lang.org/book/ch05-01-defining-structs.html).

### Pattern matching / `match`

Rust's `match` keyword lets you take apart a value (especially an enum) and react to each case, with the compiler checking you've handled every possibility. *Read more:* [Rust Book — The match Control Flow Construct](https://doc.rust-lang.org/book/ch06-02-match.html).

### Iterator

A value that produces a sequence of items, one at a time, on demand. Almost everything in Rust that can be looped over implements the `Iterator` trait. *Read more:* [Rust Book — Iterators](https://doc.rust-lang.org/book/ch13-02-iterators.html).

### Closure

An anonymous function that can capture variables from the surrounding scope. Written `|x| x + 1` or `|x, y| { x + y }`. *Read more:* [Rust Book — Closures](https://doc.rust-lang.org/book/ch13-01-closures.html).

### `Result` and `Option`

Rust's two main "this might not exist / might fail" types.

- `Option<T>` is either `Some(value)` or `None` — for things that might be absent.
- `Result<T, E>` is either `Ok(value)` or `Err(error)` — for things that might fail.

You handle them with `match`, `?` (the question-mark operator), or methods like `unwrap`. *Read more:* [Rust Book — Error Handling](https://doc.rust-lang.org/book/ch09-00-error-handling.html).

### Panic

Rust's term for a controlled crash. When something has gone catastrophically wrong (e.g. you indexed past the end of a vector) the program "panics" — it prints a message and exits. Different from a recoverable error (`Result`). *Read more:* [Rust Book — Unrecoverable Errors with panic!](https://doc.rust-lang.org/book/ch09-01-unrecoverable-errors-with-panic.html).

---

## Concurrency and async

### Thread

An independent path of execution within a program, scheduled by the operating system. Multi-threaded programs can use multiple CPU cores at once. *Read more:* [Thread (computing) — Wikipedia](https://en.wikipedia.org/wiki/Thread_(computing)).

### Concurrency vs parallelism

- **Concurrency** is about *structure* — your program is organised so multiple things are *in progress* at once. They don't have to literally run simultaneously.
- **Parallelism** is about *execution* — multiple things are literally running at the same instant on different CPU cores.

You can have one without the other. *Read more:* [Concurrent computing — Wikipedia](https://en.wikipedia.org/wiki/Concurrent_computing), Rob Pike's classic talk [Concurrency is not parallelism](https://go.dev/blog/waza-talk).

### Async / `async`/`await`

A way of writing code that does many slow things (mostly I/O — network, disk) without using one OS thread per task. Rust has `async` functions and `.await`; the actual work is run by a *runtime* like Tokio. *Read more:* [Async Book](https://rust-lang.github.io/async-book/), [Asynchronous I/O — Wikipedia](https://en.wikipedia.org/wiki/Asynchronous_I/O).

### Channel

A typed pipe between threads — one side sends messages, the other receives them. Rust's standard library provides `mpsc` (multi-producer, single-consumer) channels. *Read more:* [Rust Book — Message passing](https://doc.rust-lang.org/book/ch16-02-message-passing.html).

---

## Tools and workflow

### Git

The most widely-used **version control** system. It tracks every change to your code over time so you can rewind, branch, and collaborate. Created by Linus Torvalds for the Linux kernel. *Read more:* [Git — Wikipedia](https://en.wikipedia.org/wiki/Git), [Pro Git Book](https://git-scm.com/book/en/v2) (free).

### GitHub

A website built on top of git for hosting and collaborating on code repositories. Owned by Microsoft. Where this course lives. *Read more:* [GitHub — Wikipedia](https://en.wikipedia.org/wiki/GitHub).

### Repository / repo

A folder under git's control. Contains your code plus a hidden `.git/` directory with the full history. *Read more:* [Git glossary — Repository](https://git-scm.com/docs/gitglossary#Documentation/gitglossary.txt-aiderepositoryarepository).

### Commit

A saved snapshot of your project at one moment, with a message describing what changed. The unit of history in git. *Read more:* [Git basics — Recording changes](https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository).

### Fork

A server-side copy of a GitHub repository under your own account. Used to propose changes to someone else's project, or — as in this course — to take a copy you can edit and commit to as your own working log. *Read more:* [GitHub Docs — About forks](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/about-forks).

### Clone

A local copy of a git repository, downloaded with `git clone`. *Read more:* [git-clone — Documentation](https://git-scm.com/docs/git-clone).

### Push / pull

`git push` sends your local commits up to the remote (e.g. GitHub). `git pull` fetches and merges new commits from the remote into your local copy. *Read more:* [git-push](https://git-scm.com/docs/git-push), [git-pull](https://git-scm.com/docs/git-pull).

### Semantic versioning (SemVer)

The convention `MAJOR.MINOR.PATCH` (e.g. `1.4.7`) used by `crates.io` and most open-source ecosystems. Increment MAJOR for breaking changes, MINOR for new features, PATCH for bug fixes. *Read more:* [semver.org](https://semver.org/).

### Linker

The tool that combines compiled object files plus libraries into the final executable. Usually invoked automatically by the compiler — you only notice it when it fails. *Read more:* [Linker (computing) — Wikipedia](https://en.wikipedia.org/wiki/Linker_(computing)).

---

## Algorithms and concepts you'll meet

### Monte Carlo method

A class of algorithms that uses **random sampling** to estimate things that would be hard to calculate directly. Used in Session 1 to estimate Pi. Named after the Monte Carlo Casino. *Read more:* [Monte Carlo method — Wikipedia](https://en.wikipedia.org/wiki/Monte_Carlo_method).

### Hash function

A function that maps any input to a fixed-size value (the "hash"), in a way that small changes to the input produce wildly different outputs. Used in Session 15 for procedural generation. *Read more:* [Hash function — Wikipedia](https://en.wikipedia.org/wiki/Hash_function).

### Linear Congruential Generator (LCG)

A simple, fast pseudo-random number generator using `next = (a * current + c) mod m`. Not suitable for cryptography but perfectly fine for visual procedural generation. *Read more:* [Linear congruential generator — Wikipedia](https://en.wikipedia.org/wiki/Linear_congruential_generator).

### Sample rate (audio)

How many times per second a continuous audio signal is measured. CD-quality is **44 100 Hz**. Higher = closer to the original waveform. *Read more:* [Sampling (signal processing) — Wikipedia](https://en.wikipedia.org/wiki/Sampling_(signal_processing)).

### MIDI

The "Musical Instrument Digital Interface" — a 1983 standard for sending notes and control data between musical devices. Notes are integers 0–127. *Read more:* [MIDI — Wikipedia](https://en.wikipedia.org/wiki/MIDI), [MIDI 1.0 specification overview](https://midi.org/specs).

### WAV file format

The standard uncompressed audio file format on Windows / Mac / Linux. A short header followed by raw audio samples. *Read more:* [WAV — Wikipedia](https://en.wikipedia.org/wiki/WAV), [WAVE PCM soundfile format — sapp.org](http://soundfile.sapp.org/doc/WaveFormat/).

---

## Where to ask if you're still stuck

- **The Rust Book** — the official, free, well-written introduction: <https://doc.rust-lang.org/book/>
- **Rust by Example** — runnable snippets for almost every feature: <https://doc.rust-lang.org/rust-by-example/>
- **The Rust Users Forum** — friendly Q&A: <https://users.rust-lang.org/>
- **r/rust** — busy subreddit: <https://www.reddit.com/r/rust/>
- **Rust Discord** — live chat (ask in `#beginners`): <https://discord.gg/rust-lang>

Don't be shy about asking. The Rust community is famously welcoming to beginners.
