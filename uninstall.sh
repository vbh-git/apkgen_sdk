# restore backup of user profile file
cp ~/.bashrc.bak ~/.bashrc
source ~/.bashrc
echo "Restoration of Environment Variables  Completed"
# removing basic packages
yes | apt remove --purge openjdk-8-jdk gradle nodejs npm unzip &>/dev/null
echo "Removal of basic packages             Completed"
# removing android cmd tools
rm -rf /opt/androidcmd
echo "Removal of Android CLI                Completed"