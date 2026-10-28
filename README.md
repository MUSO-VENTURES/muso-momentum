# MUSO Momentum

Personal training app from **MUSO Fitness**, built by MUSO VENTURES.

New clients start with a discovery form. Their answers become a starting program with target metrics, a weekly blueprint, milestones, and program adjustments for injuries, health flags, equipment, and recovery. From there they train with guided timers and level up with XP and badges.

## Two versions

| Version | URL | Who it's for | Data |
|---|---|---|---|
| **Live** | https://muso-ventures.github.io/muso-momentum/ | New clients | Saved to the MUSO Fitness Supabase database. Trainer dashboard updates in real time. |
| **Trainer sign-in** | https://muso-ventures.github.io/muso-momentum/#trainer | Shane only (shane@muso-ventures.com) | Email and password checked by Supabase. Nothing secret is stored in this repo. |
| **Test backup** | https://muso-ventures.github.io/muso-momentum/test/ | Demos and testing | Example clients, demo fill, open trainer view. Stays on the device. |

The live version has no demo fill, no example clients, and no trainer toggle. Clients only see discovery and their own program.

## Live setup (one time)

1. Create a free project at supabase.com.
2. SQL Editor > New query > paste `supabase-setup.sql` > Run.
3. Authentication > Users > Add user > Create new user: `shane@muso-ventures.com` with your trainer password, and tick Auto Confirm.
4. Authentication > Sign In / Providers: turn off "Allow new users to sign up".
5. Project Settings > API: copy the Project URL and the `anon` public key into `config.js`.

Until step 5 is done, the live site shows clients a "sign-up isn't switched on yet" message and keeps their answers on screen.

## Data notes

- Clients can submit a discovery form. Only the trainer account can read, edit, or delete client records (row-level security in `supabase-setup.sql`).
- Trainer edits (metric logs, awards, co-trainers) save back to the database automatically.
- Client activity after sign-up (circuits, stretches, XP) stays on the client's own device for now.

## Features

**Client side**
- Welcome screen that leads into an 8-step discovery: profile, goals with the body focus map, contact and emergency contact, a 7-question health screen, training background, lifestyle and nutrition, optional baseline numbers, and the generated plan.
- Gyms: clients list every gym they train at or want to join, tagged Train here now, Want to join, or Drop-in or guest. Shown on the client profile and dashboard.
- Body focus map: front and back figures, female or male based on the client's sex. Clients tap the areas they want to work on (13 zones) and set a goal for each: Slim down, Build muscle, Endurance, or Mobility. Each pick adds a tape measurement or rep test, exercise focus, and milestone targets to the plan.
- Profile with level, XP, streak, badges, trainer awards, and success metrics.
- Circuit timer with work, switch, and rest phases, audio cues, and per-station logging.
- Daily Reset guided stretch with switch-sides cues.
- Progress view with circuit totals, milestones, and the level path.
- Leaderboard that stays locked until a trainer turns it on and the client opts in.

**Trainer side**
- Client dashboard for every client, opened from the roster. Shows everything from discovery in one place: contact and emergency contact, goals and motivation, body focus map, the full health screen with clearance status, training background, lifestyle and nutrition, baseline numbers, live success metrics, and the starting program. New submissions are tagged "New intake" in the roster. Copy the full profile as text or download it as JSON.
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
