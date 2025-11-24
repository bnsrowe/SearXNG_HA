#!/usr/bin/env bash
echo "[SearXNG] Starting private instance..."

if [ ! -f /config/searxng/settings.yml ]; then
    echo "[SearXNG] No settings.yml found, copying default..."
    cp /usr/local/searxng/settings.yml /config/searxng/settings.yml
fi

export SEARXNG_SETTINGS_PATH="/config/searxng/settings.yml"

python -m searxng
