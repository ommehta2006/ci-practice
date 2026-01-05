Write-Host "=== CI STARTED ==="

# 1. Required files check
$requiredFiles = @("index.html", "about.html")

foreach ($file in $requiredFiles) {
    if (-Not (Test-Path $file)) {
        Write-Host "CI FAIL: Missing file -> $file"
        exit 1
    }
}

Write-Host "File existence check passed"

# 2. Basic HTML validation
if (-Not (Select-String "<html>" index.html -Quiet)) {
    Write-Host "CI FAIL: index.html does not look like HTML"
    exit 1
}

Write-Host "HTML structure check passed"

# 3. Broken link check
if (-Not (Select-String "about.html" index.html -Quiet)) {
    Write-Host "CI FAIL: Broken or missing link to about.html"
    exit 1
}

Write-Host "Link check passed"

Write-Host "=== CI PASSED ==="
exit 0
