# From Microsoft's Powershell official preview Docker Image for debian image
FROM mcr.microsoft.com/powershell:preview-debian-bullseye-slim
# FROM mcr.microsoft.com/powershell:preview-alpine-3.15

# Obligatory update and install gssntlmssp
# RUN apt update -y
# RUN apt-get install -y gss-ntlmssp

RUN pwsh -command Set-PSRepository PSGallery -InstallationPolicy Trusted
RUN pwsh -command Install-Module PSWSMan -Force
RUN pwsh -command Install-WSMan

RUN mkdir -p /mnt/host
WORKDIR "/mnt/host"

# Launch PowerShell
ENTRYPOINT ["/usr/bin/pwsh"]
