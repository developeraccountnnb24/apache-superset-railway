import os
import secrets

# Feature flags
FEATURE_FLAGS = {
    "ENABLE_TEMPLATE_PROCESSING": True,
}

# Proxy fix for Railway
ENABLE_PROXY_FIX = True

# Secret key - auto-generate if not provided
SECRET_KEY = os.environ.get("SECRET_KEY") or secrets.token_hex(32)

# Database connection
# Priority: DATABASE_URL > DATABASE > SQLite fallback
DATABASE_URL = os.environ.get("DATABASE_URL") or os.environ.get("DATABASE")

if DATABASE_URL:
    # Handle Railway's postgres:// vs postgresql:// URL scheme
    if DATABASE_URL.startswith("postgres://"):
        DATABASE_URL = DATABASE_URL.replace("postgres://", "postgresql://", 1)
    SQLALCHEMY_DATABASE_URI = DATABASE_URL
else:
    # Fallback to SQLite for local development
    SQLALCHEMY_DATABASE_URI = "sqlite:////app/superset.db"

# Additional recommended settings
WTF_CSRF_ENABLED = True
TALISMAN_ENABLED = False  # Disable for Railway (handled by Railway's proxy)

# Cache configuration
CACHE_CONFIG = {
    "CACHE_TYPE": "SimpleCache",
    "CACHE_DEFAULT_TIMEOUT": 60 * 60 * 24,  # 1 day
}

# Webserver configuration
WEBSERVER_THREADS = 8
SUPERSET_WEBSERVER_PORT = 8088
