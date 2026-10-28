# MUSO Momentum

Personal training app from **MUSO Fitness**, built by MUSO VENTURES.

New clients start with a discovery form. Their answers become a starting program with target metrics, a weekly blueprint, milestones, and program adjustments for injuries, health flags, equipment, and recovery. From there they train with guided timers and level up with XP and badges.

## What's in the test build

**Client side**
- Welcome screen that leads into an 8-step discovery: profile, goals with the body focus map, contact and emergency contact, a 7-question health screen, training background, lifestyle and nutrition, optional baseline numbers, and the generated plan.
- Body focus map: front and back figures, female or male based on the client's sex. Clients tap the areas they want to work on (13 zones) and set a goal for each: Slim down, Build muscle, Endurance, or Mobility. Each pick adds a tape measurement or rep test, exercise focus, and milestone targets to the plan.
- Profile with level, XP, streak, badges, trainer awards, and success metrics.
- Circuit timer with work, switch, and rest phases, audio cues, and per-station logging.
- Daily Reset guided stretch with switch-sides cues.
- Progress view with circuit totals, milestones, and the level path.
- Leaderboard that stays locked until a trainer turns it on and the client opts in.

**Trainer side**
- Roster across one-on-one clients and small groups, with co-trainers.
- Full client profile: contact, emergency contact, health screen, training background, lifestyle, discovery answers.
- Metric logging, trainer awards, program builder for the circuit and stretch routines.
- Leaderboard switch with per-client consent.

## Test notes

- Everything is saved in the browser on the device you test with (localStorage). Nothing is sent to a server yet.
- "Reset test data" at the bottom of any screen clears it. "Start as a new client" runs discovery again.
- Example clients are pre-loaded so the trainer side has something to show.
- On a phone, use Add to Home Screen to run it like an app.

## Run locally

It's a single static page. Open `index.html` in a browser, or serve the folder:

```
npx serve .
```

## Deploy

GitHub Pages serves the `main` branch root.
