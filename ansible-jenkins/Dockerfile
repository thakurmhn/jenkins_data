From jenkins/jenkins

USER root

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py --user && \
    /root/.local/bin/pip install -Iv ansible==2.8.0

USER jenkins
