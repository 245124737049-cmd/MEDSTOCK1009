-- Run in Supabase Dashboard > SQL Editor > New query
create table if not exists public.medstock_workspace (user_id uuid primary key references auth.users(id) on delete cascade, data jsonb not null default '{}'::jsonb, updated_at timestamptz not null default now());
alter table public.medstock_workspace enable row level security;
drop policy if exists "Users can read their own MEDSTOCK workspace" on public.medstock_workspace;
drop policy if exists "Users can create their own MEDSTOCK workspace" on public.medstock_workspace;
drop policy if exists "Users can update their own MEDSTOCK workspace" on public.medstock_workspace;
create policy "Users can read their own MEDSTOCK workspace" on public.medstock_workspace for select to authenticated using (auth.uid() = user_id);
create policy "Users can create their own MEDSTOCK workspace" on public.medstock_workspace for insert to authenticated with check (auth.uid() = user_id);
create policy "Users can update their own MEDSTOCK workspace" on public.medstock_workspace for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
grant select, insert, update on public.medstock_workspace to authenticated;
