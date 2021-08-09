wget "https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public"
gpg --no-default-keyring --keyring ./adoptopenjdk-keyring.gpg --import public
gpg --no-default-keyring --keyring ./adoptopenjdk-keyring.gpg --export --output adoptopenjdk-archive-keyring.gpg
rm adoptopenjdk-keyring.gpg
mv adoptopenjdk-archive-keyring.gpg /usr/share/keyrings
echo "deb [signed-by=/usr/share/keyrings/adoptopenjdk-archive-keyring.gpg] https://adoptopenjdk.jfrog.io/adoptopenjdk/deb buster main" | tee /etc/apt/sources.list.d/adoptopenjdk.list
apt-get install adoptopenjdk-8-hotspot -y