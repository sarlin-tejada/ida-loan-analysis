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

Log in as root:
```bash
docker exec -it <project_name>_db mysql -u root -p
```

Then run in order:
```
sql/schema/01_create_tables.sql
sql/schema/02_create_analyst_user.sql
```

### 4. Add raw data

See [`docs/data_sources.md`](docs/data_sources.md) for download instructions.

Place files in `data/raw/`.

### 5. Import data

Use MySQL Workbench Table Data Import Wizard, or `LOAD DATA LOCAL INFILE` with `--local-infile=1` enabled (already set in docker-compose).

### 6. Connect MySQL Workbench

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
