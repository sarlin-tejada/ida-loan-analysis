# setup.ps1
# Run this script after cloning the template to configure your project.
# Usage: Right-click in VS Code terminal and run, or: .\scripts\setup.ps1

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   Data Analysis Project Setup" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# --- Collect inputs ---
$projectName   = Read-Host "Project name (lowercase, underscores only, e.g. world_bank_loans)"
$dbName        = Read-Host "MySQL database name (default: $projectName)"
$rootPassword  = Read-Host "MySQL root password"
$analystPassword = Read-Host "Analyst user password"
$mysqlPort     = Read-Host "MySQL host port (default: 3306)"

# --- Apply defaults ---
if ([string]::IsNullOrWhiteSpace($dbName))    { $dbName    = $projectName }
if ([string]::IsNullOrWhiteSpace($mysqlPort)) { $mysqlPort = "3306" }

# --- Write .env ---
$envContent = @"
PROJECT_NAME=$projectName
MYSQL_DATABASE=$dbName
MYSQL_ROOT_PASSWORD=$rootPassword
MYSQL_PORT=$mysqlPort

# Analyst user (created manually after container is up — see README)
# ANALYST_USER=analyst
# ANALYST_PASSWORD=$analystPassword
"@

Set-Content -Path ".env" -Value $envContent
Write-Host ""
Write-Host ".env created." -ForegroundColor Green

# --- Confirm docker-compose.yml exists ---
if (-Not (Test-Path "docker-compose.yml")) {
    Write-Host "docker-compose.yml not found. Are you in the project root?" -ForegroundColor Red
    exit 1
}

# --- Summary ---
Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   Setup complete. Next steps:" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  1. Start the database:" -ForegroundColor White
Write-Host "     docker-compose up -d" -ForegroundColor Yellow
Write-Host ""
Write-Host "  2. Verify the container is running:" -ForegroundColor White
Write-Host "     docker ps" -ForegroundColor Yellow
Write-Host ""
Write-Host "  3. Log into MySQL as root:" -ForegroundColor White
Write-Host "     docker exec -it ${projectName}_db mysql -u root -p" -ForegroundColor Yellow
Write-Host ""
Write-Host "  4. Create analyst user (see README for SQL):" -ForegroundColor White
Write-Host "     sql/schema/02_create_analyst_user.sql" -ForegroundColor Yellow
Write-Host ""
Write-Host "  5. Add your raw data to data/raw/" -ForegroundColor White
Write-Host "     Update docs/data_sources.md with download details" -ForegroundColor Yellow
Write-Host ""
Write-Host "  6. Create your tables:" -ForegroundColor White
Write-Host "     sql/schema/01_create_tables.sql" -ForegroundColor Yellow
Write-Host ""
