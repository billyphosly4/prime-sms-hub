#!/usr/bin/env bash
set -euo pipefail

echo "[start.sh] Starting deploy script"
echo "[start.sh] Current dir: $(pwd)"

# Navigate to backend directory
cd backend

echo "[start.sh] Backend dir: $(pwd)"

# Use python3 explicitly to avoid ambiguous python alias
PYTHON=${PYTHON:-python3}

echo "[start.sh] Using python: $(which $PYTHON || echo 'not found')"

# Apply migrations and collect static files for deployment
echo "[start.sh] Running migrations"
$PYTHON manage.py migrate --noinput

echo "[start.sh] Collecting static files"
$PYTHON manage.py collectstatic --noinput

echo "[start.sh] Starting Daphne ASGI server on port ${PORT:-8000}"
exec daphne -b 0.0.0.0 -p ${PORT:-8000} prime_sms.asgi:application
