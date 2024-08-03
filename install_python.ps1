# Prompt user and ask for confirmation to continue
$creator = "Emad."
Write-Host "Script created by $creator."
$confirm = Read-Host "Do you want to continue? (yes/no)"

if ($confirm.ToLower() -ne "yes") {
    Write-Host "Installation aborted."
    exit
}

# Set execution policy for CurrentUser scope
try {
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force -ErrorAction Stop
    Write-Host "Execution policy set to RemoteSigned for CurrentUser scope."
} catch {
    Write-Host "Failed to set execution policy. Error: $_"
    exit 1
}

# Set variables
$pythonInstaller = "E:\Apps\python-3.12.0-amd64.exe"
$installationDir = "E:\PythonInstallation"

# Create installation directory if it doesn't exist
if (-not (Test-Path -Path $installationDir)) {
    New-Item -Path $installationDir -ItemType Directory | Out-Null
}

# Install Python silently
Write-Host "Installing Python..."
Start-Process -FilePath $pythonInstaller -ArgumentList "/quiet", "InstallAllUsers=1", "PrependPath=1", "TargetDir=`"$installationDir`"" -Wait

# Set Python and Scripts directory paths
$pythonPath = Join-Path -Path $installationDir -ChildPath "Python312"
$pythonExePath = Join-Path -Path $pythonPath -ChildPath "python.exe"
$pipExePath = Join-Path -Path $pythonPath -ChildPath "Scripts\pip.exe"

Write-Host "Python installed successfully Close the Current window and Try to write python --version in another terminal"

# End of script
