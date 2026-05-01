# [Project Title]

> One sentence describing what this project analyzes and why it's interesting.

---

## Overview

[2–3 sentences on the dataset, the analytical question, and what you found.]

---

## Setup

### Prerequisites
- Docker Desktop
- MySQL Workbench

### 1. Clone and configure

```bash
git clone <your-repo-url>
cd <project-folder>
.\scripts\setup.ps1
```

The setup script will prompt you for project name, database name, passwords, and port — and write your `.env` automatically.

### 2. Start the database

```bash
docker-compose up -d
docker ps   # confirm container is running
```

### 3. Create tables and analyst user

Open MySQL Workbench and create a new connection:
- Host: `127.0.0.1`
- Port: as set in `.env`
- User: `root`
- Password: as set during setup

Verify the database exists:
- Expand the schema panel and confirm `<database_name>` appears

Then run in order:
1. Open and execute `sql/schema/01_create_tables.sql`
2. Verify the table was created — refresh schemas and confirm table appears
3. Open and execute `sql/schema/02_create_analyst_user.sql`
4. Verify analyst user — run `SELECT user, host FROM mysql.user WHERE user = 'analyst';`

### 4. Add raw data

See [`docs/data_sources.md`](docs/data_sources.md) for download instructions.

Place files in `data/raw/`.

### 5. Import data

Update the file path in `sql/schema/03_import_data.sql` to match your local `data/raw/` directory.

Open and execute `sql/schema/03_import_data.sql` in Workbench as root.

Verify the import:
- Run `SELECT COUNT(*) FROM <table_name>;` and confirm row count matches expected total.

Note: If import returns 0 rows, check `LINES TERMINATED BY` in the script — try `'\r\n'` if `'\n'` doesn't work.

### 6. Create a new connection using analyst credentials

Open MySQL Workbench and create a new connection:
- Host: `127.0.0.1`
- Port: as set in `.env`
- User: `analyst`
- Password: as set during setup

---

## Project Structure

```
├── data/
│   ├── raw/          # Source files — never modified (gitignored)
│   ├── interim/      # Mid-processing outputs (gitignored)
│   └── processed/    # Final outputs for Tableau (gitignored)
├── sql/
│   ├── schema/       # DDL — table definitions, user setup
│   ├── exploration/  # Numbered scratch queries
│   └── analysis/     # Final numbered queries by question
├── docs/             # Data dictionary, notes, data sources
├── scripts/
│   └── setup.ps1     # Project setup script
├── docker-compose.yml
├── .env.example
└── .gitignore
```

---

## Analysis

[Document your key questions and findings here as you work through them.]

### Question 1: [Question]
- **Hypothesis:**
- **Query:** `sql/analysis/01_...sql`
- **Finding:**

### Question 2: [Question]
- **Hypothesis:**
- **Query:** `sql/analysis/02_...sql`
- **Finding:**

---

## Key Findings

1.
2.
3.

---

## Data Sources

See [`docs/data_sources.md`](docs/data_sources.md).
