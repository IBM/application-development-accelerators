sudo dnf install -y --nogpgcheck https://github.com/ibmruntimes/semeru21-binaries/releases/download/jdk-21.0.12.0/ibm-semeru-open-21-jdk-21.0.12.0-1.x86_64.rpm

sudo dnf install -y maven

sudo alternatives --set java /usr/lib/jvm/ibm-semeru-open-21-jdk/bin/java
sudo alternatives --set javac /usr/lib/jvm/ibm-semeru-open-21-jdk/bin/javac

mvn install:install-file \
  -Dfile=plugins/ldm-parent/ldm-parent-1.0.0-SNAPSHOT.pom \
  -DpomFile=plugins/ldm-parent/ldm-parent-1.0.0-SNAPSHOT.pom
  
mvn install:install-file \
  -Dfile=plugins/ldm-common-client/ldm-common-client-1.0.0-SNAPSHOT.jar \
  -DpomFile=plugins/ldm-common-client/ldm-common-client-1.0.0-SNAPSHOT.pom
  
mvn install:install-file \
  -Dfile=plugins/liberty-maven/liberty-maven-1.0.0-ldm-SNAPSHOT.pom \
  -DpomFile=plugins/liberty-maven/liberty-maven-1.0.0-ldm-SNAPSHOT.pom
  
mvn install:install-file \
  -Dfile=plugins/ci.common/ci.common-1.0.0-ldm-SNAPSHOT.jar \
  -DpomFile=plugins/ci.common/ci.common-1.0.0-ldm-SNAPSHOT.pom
  
mvn install:install-file \
  -Dfile=plugins/liberty-maven-plugin/liberty-maven-plugin-1.0.0-ldm-SNAPSHOT.jar \
  -DpomFile=plugins/liberty-maven-plugin/liberty-maven-plugin-1.0.0-ldm-SNAPSHOT.pom


curl -L -O -J https://ibm.box.com/shared/static/fdx7ctvrj5h0xyywhb7fczjs9lqfo6tz.vsix

bobide --install-extension redhat.java@1.57.0 --donot-auto-update
bobide --install-extension liberty-dev-vscode-ext-26.0.10-MCP-SNAPSHOT.vsix