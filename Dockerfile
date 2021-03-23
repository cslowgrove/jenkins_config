FROM jenkins/jenkins

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

RUN /usr/local/bin/install-plugins.sh \
  config-file-provider \
  workflow-support \
  apache-httpcomponents-client-4-api \
  parameterized-trigger \
  python \
  managed-scripts \
  resource-disposer \
  workflow-aggregator \
  workflow-api \
  credentials-binding \
  lockable-resources \
  pipeline-model-extensions \
  pipeline-input-step \
  matrix-project \
  pipeline-github-lib \
  run-condition \
  windows-slaves \
  momentjs \
  git \
  gradle \
  port-allocator \
  display-url-api \
  ruby-runtime \
  jquery \
  docker-workflow \
  command-launcher \
  ssh-credentials \
  cloudbees-folder \
  pipeline-stage-view \
  handlebars \
  token-macro \
  okhttp-api \
  m2release \
  snakeyaml-api \
  ldap \
  pipeline-milestone-step \
  git-server \
  plain-credentials \
  jackson2-api \
  bouncycastle-api \
  scm-api \
  timestamper \
  trilead-api \
  build-timeout \
  workflow-cps-global-lib \
  pipeline-stage-tags-metadata \
  nodelabelparameter \
  ace-editor \
  pipeline-model-api \
  build-with-parameters \
  github-api \
  pipeline-build-step \
  git-client \
  branch-api \
  pipeline-model-declarative-agent \
  translation \
  pipeline-rest-api \
  workflow-scm-step \
  credentials \
  thinBackup \
  jdk-tool \
  workflow-job \
  email-ext \
  mapdb-api \
  workflow-durable-task-step \
  github-branch-source \
  jquery-detached \
  perl \
  android-emulator \
  junit \
  ant \
  pipeline-model-definition \
  icon-shim \
  jsch \
  external-monitor-job \
  pam-auth \
  authentication-tokens \
  ws-cleanup \
  workflow-cps \
  structs \
  durable-task \
  antisamy-markup-formatter \
  maven-plugin \
  hudson-wsclean-plugin \
  github \
  matrix-auth \
  conditional-buildstep \
  workflow-multibranch \
  script-security \
  workflow-step-api \
  pipeline-graph-analysis \
  ssh-slaves \
  workflow-basic-steps \
  pipeline-stage-step \
  mailer \
  javadoc \
  saferestart \
  copyartifact \
  docker-commons \
  git-parameter

USER root

RUN apt-get update -qq && \
    apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    apt-key fingerprint 0EBFCD88 && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update -qq && \
    apt-get install -qqy docker-ce && \
    usermod -aG docker jenkins && \
    chown -R jenkins:jenkins $JENKINS_HOME/

#USER jenkins
