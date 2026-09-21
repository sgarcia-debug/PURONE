-- PUR ONE: esquema inicial multiusuario con aislamiento por propietario.
create extension if not exists pgcrypto;
create table if not exists public.clients (
 id uuid primary key default gen_random_uuid(),
 user_id uuid not null references auth.users(id) on delete cascade,
 name text not null,
 company text,
 email text,
 status text not null default 'Lead' check (status in ('Lead','Contactado','Cliente','Inactivo')),
 created_at timestamptz not null default now()
);
create table if not exists public.tasks (
 id uuid primary key default gen_random_uuid(),
 user_id uuid not null references auth.users(id) on delete cascade,
 title text not null,
 status text not null default 'Pendiente' check (status in ('Pendiente','Completada')),
 due_date date,
 created_at timestamptz not null default now()
);
create table if not exists public.activities (
 id uuid primary key default gen_random_uuid(),
 user_id uuid not null references auth.users(id) on delete cascade,
 title text not null,
 kind text not null default 'Nota',
 created_at timestamptz not null default now()
);
alter table public.clients enable row level security;
alter table public.tasks enable row level security;
alter table public.activities enable row level security;
create policy "clients_owner_all" on public.clients for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "tasks_owner_all" on public.tasks for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "activities_owner_all" on public.activities for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
create index if not exists clients_user_created_idx on public.clients(user_id, created_at desc);
create index if not exists tasks_user_created_idx on public.tasks(user_id, created_at desc);
create index if not exists activities_user_created_idx on public.activities(user_id, created_at desc);
