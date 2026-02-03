# Apache Superset on Railway

Deploy Apache Superset 4.x to Railway with one click.

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/new/template?template=https://github.com/DavidZha1994/apache-superset-railway)

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://buymeacoffee.com/yzha)

## Features

- **Superset 4.x** - Latest version with modern UI and features
- **PostgreSQL & MySQL** - Database drivers pre-installed
- **Auto Setup** - Admin user and database auto-configured
- **Railway Optimized** - Production-ready configuration

## Deploy Steps

### Step 1: Deploy Superset
Click the **Deploy on Railway** button above

### Step 2: Add PostgreSQL
1. In your Railway project, click **+ New**
2. Select **Database** → **Add PostgreSQL**

### Step 3: Connect Database
1. Click on your **Superset** service
2. Go to **Variables** tab
3. Add new variable: `DATABASE_URL` = `${{Postgres.DATABASE_URL}}`
4. Redeploy the service

### Step 4: Access Superset
1. Wait 2-3 minutes for initialization
2. Open your Superset service URL
3. Login with `admin` / `admin`

## Default Credentials

| Username | Password |
|----------|----------|
| `admin` | `admin` |

> ⚠️ **Security**: Change the default password after first login!

## Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `DATABASE_URL` | Required | `${{Postgres.DATABASE_URL}}` |
| `ADMIN_USERNAME` | `admin` | Admin username |
| `ADMIN_PASSWORD` | `admin` | Admin password |
| `ADMIN_EMAIL` | `admin@superset.local` | Admin email |
| `SECRET_KEY` | Auto-generated | Flask secret key |

## Supported Databases

Connect to your data warehouses:

- PostgreSQL
- MySQL / MariaDB
- SQLite
- And 40+ more via SQLAlchemy

## Resources

- [Apache Superset Documentation](https://superset.apache.org/docs/intro)
- [Railway Documentation](https://docs.railway.app/)
- [Superset Database Drivers](https://superset.apache.org/docs/configuration/databases)

## License

Apache License 2.0
