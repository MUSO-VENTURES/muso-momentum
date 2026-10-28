-- MUSO Momentum: client database setup
-- Run once in Supabase > SQL Editor > New query > paste > Run.

create table if not exists public.clients (
  id          uuid primary key default gen_random_uuid(),
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now(),
  name        text not null check (char_length(name) between 1 and 120),
  data        jsonb not null check (pg_column_size(data) < 500000)
);

alter table public.clients enable row level security;

-- Anyone can submit a discovery form. Nobody but the trainer can read it back.
drop policy if exists "clients can submit discovery" on public.clients;
create policy "clients can submit discovery"
  on public.clients for insert
  to anon, authenticated
  with check (true);

-- Only the trainer account can read, update, or delete client records.
drop policy if exists "trainer reads clients" on public.clients;
create policy "trainer reads clients"
  on public.clients for select
  to authenticated
  using (lower(auth.jwt() ->> 'email') = 'shane@muso-ventures.com');

drop policy if exists "trainer updates clients" on public.clients;
create policy "trainer updates clients"
  on public.clients for update
  to authenticated
  using (lower(auth.jwt() ->> 'email') = 'shane@muso-ventures.com')
  with check (lower(auth.jwt() ->> 'email') = 'shane@muso-ventures.com');

drop policy if exists "trainer deletes clients" on public.clients;
create policy "trainer deletes clients"
  on public.clients for delete
  to authenticated
  using (lower(auth.jwt() ->> 'email') = 'shane@muso-ventures.com');

-- Live updates on the trainer dashboard.
do $$ begin
  alter publication supabase_realtime add table public.clients;
exception when duplicate_object then null; end $$;
