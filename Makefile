.PHONY: secrets

SUDO = sudo
MAKE = make
SECRETS_DIR = secret

secrets: mkdir_secrets ${SECRET_TARGETS}
	@tput setaf 1 && echo "Don't forget to actually DEPLOY the secrets!" && tput sgr0

mkdir_secrets:
	mkdir -pm 0700 ${SECRETS_DIR}

certreq:
	openssl genrsa -out ${SECRETS_DIR}/${role}_key.pem 4096
	cp cert.conf ${role}_cert.conf
	echo "CN = ${fqdn}" >> ${role}_cert.conf
	openssl req -new -config ${role}_cert.conf -key ${SECRETS_DIR}/${role}_key.pem -out ${SECRETS_DIR}/${role}_csr.pem
	rm ${role}_cert.conf
	@tput setaf 1 0 0 && echo "Follow the steps at https://www.utdallas.edu/infosecurity/DigitalCertificates_SSL.html and put the resulting key at ${SECRETS_DIR}/${role}_cert.pem" && tput sgr0

webserver_cert:
	${MAKE} role=webserver fqdn=lug.utdallas.edu certreq
