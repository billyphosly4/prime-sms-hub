**Render Deployment Instructions**

- **Build**: Render will run `pip install -r requirements.txt` (configured in `render.yaml`).
- **Start**: `bash start.sh` (calls migrations, `collectstatic`, then starts Daphne from `backend`).

Required environment variables (set in Render Dashboard):

- `SECRET_KEY` — Django secret (see [backend/prime_sms/settings.py](backend/prime_sms/settings.py#L19)).
- `DEBUG` — set to `False` in production (see [backend/prime_sms/settings.py](backend/prime_sms/settings.py#L22)).
- `ALLOWED_HOSTS` — comma-separated hosts (see [backend/prime_sms/settings.py](backend/prime_sms/settings.py#L24)).
- `DATABASE_URL` — Postgres URL if using Postgres (see [backend/prime_sms/settings.py](backend/prime_sms/settings.py#L76)).
- `REDIS_URL` — Redis for Channels in production (see [backend/prime_sms/settings.py](backend/prime_sms/settings.py#L201)).
- `FIREBASE_API_KEY`, `FIREBASE_AUTH_DOMAIN`, `FIREBASE_PROJECT_ID`, `FIREBASE_STORAGE_BUCKET`, `FIREBASE_MESSAGING_SENDER_ID`, `FIREBASE_APP_ID` — Firebase config (see [backend/prime_sms/settings.py](backend/prime_sms/settings.py#L174-L179)).
- `PAYSTACK_PUBLIC_KEY`, `PAYSTACK_SECRET_KEY` — Paystack keys (see [backend/prime_sms/settings.py](backend/prime_sms/settings.py#L182-L183)).
- `FIVESIM_API_KEY` — 5sim API key (see [backend/prime_sms/settings.py](backend/prime_sms/settings.py#L185)).
- `SENDGRID_API_KEY`, `SENDGRID_FROM_EMAIL` — SendGrid settings (see [backend/prime_sms/settings.py](backend/prime_sms/settings.py#L188-L189)).
- `TELEGRAM_BOT_TOKEN`, `TELEGRAM_ADMIN_CHAT_ID`, `TELEGRAM_WEBHOOK_SECRET` — Telegram settings (see [backend/prime_sms/settings.py](backend/prime_sms/settings.py#L192-L195)).
- `ADMIN_DASHBOARD_SECRET` — admin automation secret (see [backend/prime_sms/settings.py](backend/prime_sms/settings.py#L198)).

Notes:
- After setting env vars, Render will run `start.sh` which executes migrations and `collectstatic` then starts Daphne.
- If you enable `REDIS_URL`, Channels will use `channels_redis` (ensure Redis addon is provisioned).
