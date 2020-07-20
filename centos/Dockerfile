From centos:7

RUN yum install -y openssh-server passwd opnessh mysql ntp
RUN useradd remote_user && \
	echo 'Letme1in' | passwd remote_user --stdin && \
	mkdir /home/remote_user/.ssh && \
	chmod 700 /home/remote_user/.ssh && \
        chown -R remote_user:remote_user /home/remote_user/.ssh/
COPY remote-key.pub /home/remote_user/.ssh/authorized_keys
RUN chown remote_user:remote_user /home/remote_user/.ssh/authorized_keys && \
	chmod 700 /home/remote_user/.ssh/authorized_keys

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
	python get-pip.py --user && \
	export PATH=~/.local/bin:$PATH && \
	pip install awscli --upgrade

RUN /usr/sbin/sshd-keygen
CMD /usr/sbin/sshd -D
