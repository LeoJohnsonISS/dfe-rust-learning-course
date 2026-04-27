# Session 0 — Setup & GitHub (Pre-flight)

> **Read this before Session 1.** This isn't one of the 24 numbered DofE sessions — it's a one-off prerequisite to get your tools working. Budget about 45–60 minutes. You won't write any Rust here, but by the end you'll have a working Rust toolchain, a GitHub account, your own fork of the course, and your first commit.

---

## What You'll Learn

- What **Rust**, **rustup**, and **cargo** are, and why they come together
- What **git** and **GitHub** are, and why almost every professional developer uses them
- How to **fork** a repository — make your own copy of someone else's project
- How to **clone** that fork to your laptop so you can edit it
- How to **commit** and **push** your changes back up to GitHub

These are the same first-day-on-the-job steps used by professional Rust developers at Microsoft, Discord, Cloudflare, AWS, and the Linux kernel project. You're learning the actual workflow, not a simplified school version.

---

## The Big Idea

Two ecosystems power almost all serious software development today: a **language toolchain** (compiler + package manager + project tool) and a **version-control host** (somewhere to store and share code with a complete history of every change).

For Rust, the toolchain is `rustup` (installer), `rustc` (compiler), and `cargo` (project manager + package manager + test runner). For version control, the tool is `git` and the host the world has standardised on is `github.com`.

Setting both up before Session 1 means everything afterwards "just works".

---

## Why GitHub matters for your DofE pack

You can complete this course entirely on paper — print the booklet, fill it in, hand the binder to your assessor. That's [Path A in the print checklist](../../dfe/print-checklist.md).

But there's a second option (**Path B**) that's worth considering:

> Fork the course repo, treat it as your working log, commit after every session. The commit history becomes a tamper-resistant, automatically-dated record of every session you completed. You still print the binder for the assessor — but you have an unforgeable timeline backing it up.

This session sets you up for either path. You can decide later.

Full details on the two paths: [`dfe/github-workflow.md`](../../dfe/github-workflow.md).

---

## Step-by-Step Walkthrough

### Part 1 — Install Rust (15 minutes)

Follow the steps in the project's [`SETUP.md`](../../SETUP.md). The short version:

**macOS or Linux:**

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Accept the defaults. After it finishes, restart your terminal (or run `source "$HOME/.cargo/env"`).

**Windows:**

Download and run [`rustup-init.exe`](https://www.rust-lang.org/tools/install). Accept the defaults.

**Verify it worked:**

```bash
rustc --version
cargo --version
```

Both should print a version (currently 1.95 or newer). If they don't, fix this before going any further — the rest of the course depends on it.

> **Why an installer rather than a download?** `rustup` is a *toolchain manager*. It can keep Rust up to date (`rustup update`), install nightly versions, or install Rust for cross-compilation. You'll be glad of it later.

### Part 2 — Create a GitHub account (5 minutes)

If you already have one, skip this part.

1. Go to **<https://github.com/signup>**.
2. Use a real email you check (it's how commits get attributed to you).
3. Pick a username you wouldn't be embarrassed to put on a CV — something close to your real name is fine.
4. Verify your email when GitHub sends the confirmation message.

> **Age requirements.** You must be at least 13 to have a GitHub account. If you're 13–17, GitHub's terms apply normally; check with a parent or guardian if you're unsure. (See [GitHub's Terms of Service](https://docs.github.com/site-policy/github-terms/github-terms-of-service).)

### Part 3 — Install git (5 minutes)

**macOS:** if `git --version` already prints something, you're done. If not:

```bash
xcode-select --install
```

**Windows:** download from <https://git-scm.com/download/win>. Accept the defaults.

**Linux (Debian / Ubuntu):**

```bash
sudo apt update && sudo apt install git
```

(Or your distro's equivalent.)

**Verify:**

```bash
git --version
```

### Part 4 — Tell git who you are (2 minutes)

Run these once. Use the **same email** you used to sign up to GitHub — that's how GitHub links your commits to your profile.

```bash
git config --global user.name "Your Real Name"
git config --global user.email "you@example.com"
git config --global init.defaultBranch main
```

### Part 5 — Fork the course repo (3 minutes)

1. In your browser, open **<https://github.com/Zesty0wl/dfe-rust-learning-course>**.
2. Click the **Fork** button in the top right.
3. Confirm the owner is *your* account; leave the name as `dfe-rust-learning-course`.
4. Click **Create fork**.

You now have your own copy at `https://github.com/<your-username>/dfe-rust-learning-course`. Anything you push to your fork is yours; you can't accidentally change the original.

> **What just happened?** A fork is a *server-side copy*. GitHub remembers your fork is descended from the original, which means later you can pull in any updates the original repo gets (e.g. bug fixes to the example code). Forking is how almost all open-source contribution starts.

### Part 6 — Clone your fork to your laptop (5 minutes)

"Clone" means download a working copy you can edit. In a terminal:

```bash
cd ~/Projects        # or wherever you keep code; create the folder if needed
git clone https://github.com/<your-username>/dfe-rust-learning-course.git
cd dfe-rust-learning-course
```

You should now see all the course files listed:

```bash
ls
# README.md  SETUP.md  dfe  month-1  month-2  month-3  rust-course-prd.md  ...
```

### Part 7 — Make your first edit and commit (10 minutes)

Open `dfe/session-log.md` in your editor of choice (VS Code, nano, whatever) and find this line near the top:

```
| Participant name | _Your Name Here_ |
```

Change `_Your Name Here_` to your actual name. Save the file.

Now stage, commit, and push the change:

```bash
git add dfe/session-log.md
git status                                    # see what's staged
git commit -m "session 0: add my name to the log"
git push
```

The first time you push, your terminal may pop up a browser window asking you to authorise the push. Click through it; this only happens once.

Refresh your fork's page on github.com — you should see your commit at the top of the file history. **That's your first commit. You've just done what professional developers do every day.**

### Part 8 — Confirm the toolchain works end to end (5 minutes)

Run a small Rust program from the course to make sure everything's wired up:

```bash
cd month-1/session-01/examples/hello_world
cargo run
```

You should see Rust download a few things on first run, then print a "Hello, world!" greeting. If you see that, you're done. Close the terminal and take a break — Session 1 is next.

---

## Concepts Covered

- **Toolchain installation** — `rustup`, `rustc`, `cargo`
- **GitHub account creation**
- **git basics** — `config`, `clone`, `add`, `commit`, `push`, `status`
- **Forking** — making your own server-side copy of a repo
- **The fork → clone → edit → commit → push loop**

---

## Did It Work?

You're ready for Session 1 if all of these are true:

- [ ] `rustc --version` prints a version
- [ ] `cargo --version` prints a version
- [ ] `git --version` prints a version
- [ ] You can see your fork at `https://github.com/<your-username>/dfe-rust-learning-course`
- [ ] You've made and pushed at least one commit
- [ ] `cargo run` worked in the `hello_world` example folder

If any of those fail, fix them before moving on. Asking for help is fine — your assessor would much rather you get unstuck early than struggle silently for two months.

---

## Common Questions

**I don't want to use GitHub. Can I skip this?**
Yes. Skip Parts 2, 5, 6, and 7. You still need Parts 1, 3, 4, and 8 (you need Rust installed and a working `cargo run`). You'll keep your DofE log on paper using `dfe/session-log-printable.md` instead.

**My push asked for a password and rejected it.**
GitHub deprecated password authentication for git. Either install [GitHub CLI](https://cli.github.com) and run `gh auth login`, or [create a Personal Access Token](https://docs.github.com/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens) and use it as your password. The GitHub CLI route is by far the simplest.

**Is my fork private or public?**
Public by default. That's fine — there's nothing sensitive in there, and a public link is the easiest way to share with your assessor later. If you'd rather it be private, go to the fork's **Settings → Danger Zone → Change visibility**.

**Should I commit after every session, or once at the end?**
After every session. The point of git is the timeline — one big commit at the end has no more evidential value than a typed list. Small, regular commits are what makes the history believable.

---

## Further Reading

Curated extra material on the topics covered in this session (Setup & GitHub). All free; all current as of writing.

- [**The Rust Programming Language** — *Installation* (chapter 1.1)](https://doc.rust-lang.org/book/ch01-01-installation.html) — The official install guide. Worth bookmarking; you'll come back to chapter 3 a lot.
- [**Pro Git** (free book) — chapters 1 & 2](https://git-scm.com/book/en/v2) — The definitive guide to git. You only need the first ~80 pages for this course; chapters 3+ are for the curious.
- [**GitHub Docs — *Hello World* tutorial**](https://docs.github.com/en/get-started/start-your-journey/hello-world) — GitHub's own 10-minute walkthrough that mirrors what you just did, with screenshots.
- [**Atlassian Git tutorials**](https://www.atlassian.com/git/tutorials) — Excellent, gentle explanations of every git concept with diagrams. Great for when a command does something surprising.
- [**Oh Shit, Git!?!** — recovering from common mistakes](https://ohshitgit.com) — Bookmark this. Three commits in, you'll need it.

---
## DofE Log Reminder

> 📝 This is a pre-flight session, not one of the 24 numbered DofE sessions. **Don't fill in a session-log row for it.** But if you're using the GitHub workflow, your "session 0: add my name to the log" commit is the first entry of your evidence trail — your assessor will see it on the printed commit-history page at the back of the binder.

---

## Next Up

[**Session 1 — Why Rust? History, Setup, and the Speed Demo**](../session-01/)
