# create a backup of current user profile file
cp ~/.bashrc ~/.bashrc.bak
# creation of setup folder for temporary files
rm -rf setup
mkdir setup
mkdir generated_apps
mkdir Android &>/dev/null
mkdir Android/Sdk &>/dev/null
cd setup
# installing basic packages
yes | apt install openjdk-8-jdk gradle nodejs npm unzip &>/dev/null
echo "Installation Basic Packages       Completed"
# downloading and setting up android tools
rm -rf /opt/androidcmd
mkdir /opt/androidcmd
wget https://dl.google.com/android/repository/commandlinetools-linux-6200805_latest.zip &>/dev/null
unzip *.zip &>/dev/null
rm *.zip
mv tools /opt/androidcmd/
echo "Installation Android CLI          Completed"
# setting up environment variables and aliases
echo "export ANDROID_HOME=/root/Android/Sdk" >> ~/.bashrc
echo "export ANDROID_CMD=/opt/androidcmd/tools/bin" >> ~/.bashrc
echo "export PATH=${ANDROID_HOME}/build-tools:$PATH" >> ~/.bashrc
echo "export PATH=${ANDROID_HOME}/platform-tools:$PATH" >> ~/.bashrc
echo "export PATH=${ANDROID_CMD}:$PATH" >> ~/.bashrc
echo "alias sdkmanager='sdkmanager --sdk_root=${ANDROID_HOME}'" >> ~/.bashrc
source /root/.bashrc
echo "Declaration Environment Variables Completed"
# download the android sdk tools
yes | sdkmanager --licenses &>/dev/null
sdkmanager --install "platform-tools" "build-tools;29.0.3" &>/dev/null
echo "Installation Android SDK          Completed"
# installing cordova sdk
npm install -g cordova &>/dev/null
echo "Installation Cordova              Completed"
cd 
rm -rf setup
# speed up cordova by initiating first app
cordova create myapp &>/dev/null
cd myapp
cordova platform add android &>/dev/null
cordova build android &>/dev/null
cd ../
rm -rf myapp
echo "Testing Setup                     Completed"
echo "Exiting :)"
