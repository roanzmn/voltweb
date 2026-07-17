-- VoltWeb Lead-Formular: einmalig im Supabase SQL-Editor ausführen
-- (Dashboard → SQL Editor → New query → einfügen → Run)

create table public.leads (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),
  name text not null,
  tel text not null,
  firma text
);

-- Row Level Security: Besucher (anon) dürfen Anfragen NUR einfügen,
-- niemals lesen, ändern oder löschen. Lesen kannst du selbst im Dashboard.
alter table public.leads enable row level security;

create policy "Anon darf Leads einfuegen"
  on public.leads
  for insert
  to anon
  with check (true);
