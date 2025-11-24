#!/usr/bin/env bash
echo "[SearXNG] Starting Private SearXNG..."

SETTINGS_PATH="/config/searxng/settings.yml"
ENGINES_PATH="/config/searxng/engines.yml"

# Ensure config directory exists
mkdir -p /config/searxng

echo "[SearXNG] Checking settings.yml..."
if [ ! -f "$SETTINGS_PATH" ]; then
    echo "[SearXNG] No settings.yml found, copying default..."
    cp /usr/local/searxng/settings.yml "$SETTINGS_PATH"
fi

echo "[SearXNG] Checking engines.yml..."
if [ ! -f "$ENGINES_PATH" ]; then
    echo "[SearXNG] No engines.yml found, copying default..."
    cp /usr/local/searxng/searx/engines.yml "$ENGINES_PATH"
fi

export SEARXNG_SETTINGS_PATH="$SETTINGS_PATH"
export SEARXNG_ENGINES_PATH="$ENGINES_PATH"

echo "[SearXNG] Launching Granian..."
exec granian --interface asgi searxng.webapp.app --host 0.0.0.0 --port 8080
