# `sand-sim` v0.2 — Month 2 Milestone

> 🚧 **This folder is a placeholder.** It'll fill up as you work through Month 2.

This is where your **`sand-sim` v0.2** lives. It starts as a copy of the v0.1 project from Month 1, then grows through eight sessions of chemistry: fire, oil, lava, water boiling to steam, ice melting, acid, and the reactions HashMap that ties them all together.

## How it gets built

| Session | What goes into this folder |
|---|---|
| **9** | Copy your finished v0.1 from `month-1/milestone/sand-sim-v0.1/` into this folder. From here on, *every* edit happens here — no per-session `starter/` / `solution/` snapshots. Your git history is the snapshot. |
| 10–14 | Add struct fields, enums-with-data, `Option<T>`, iterators, and the `HashMap`-backed reactions table — all in this same Cargo project. |
| **15** | Lava + Ice + chain reactions added via the reactions table. |
| **16** | Reaction balancing, heat-map overlay, element counts, audio effects (fire crackle, lava sizzle, oil-ignition thump). **v0.2 ships.** |

## How you run it (once it exists)

```bash
cd month-2/milestone/sand-sim-v0.2
cargo run --release
```

## `assets/`

The Session 16 audio (CC0 WAV files) lives in [`assets/`](./assets/) once you reach that session, with attributions in [`assets/CREDITS.md`](./assets/CREDITS.md). Until then this folder is intentionally bare.

---

Back to [`month-2/README.md`](../../README.md) · previous milestone: [`month-1/milestone/sand-sim-v0.1/`](../../../month-1/milestone/sand-sim-v0.1/) · next: [`month-3/milestone/sand-sim-v1.0/`](../../../month-3/milestone/sand-sim-v1.0/).
