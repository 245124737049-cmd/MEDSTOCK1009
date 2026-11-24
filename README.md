# MEDSTOCK — Supabase-connected build (no email/password login)

## Setup
1. In Supabase Dashboard → Authentication → Sign-in methods, enable **Anonymous Sign-Ins**.
2. In SQL Editor → New query, paste and run `supabase-setup.sql`.
3. Serve `index.html` using VS Code Live Server.
4. On first launch, choose whether your pharmacy provides home delivery. No email, password, pharmacy ID, or time-limit login is required.
5. Enter the pharmacy name (for example, Apollo Pharmacy) in the Billing screen; it is printed on that invoice only.

## Cloud and security
- The app uses Supabase anonymous authentication behind the scenes so it can save records under an anonymous account without asking for login details. This is not a user identity or recovery mechanism: clearing browser data or changing browsers may make that anonymous workspace inaccessible.
- If anonymous sign-in is disabled, cloud sync will not start. Enable it in Supabase Auth settings.
- Browser code uses only the project URL and publishable key. Never put a secret/service-role key in frontend code. Rotate the secret key previously exposed in chat.
- Row-level security restricts each anonymous/authenticated account to its own workspace.
- This prototype stores the workspace as one JSON document per account. For production pharmacy use, use normalized tables, audit logs, backups, and transactional stock/billing logic. Host over HTTPS.
