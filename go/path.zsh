# Go
if [ -x "$(command -v go)" ] && [ -z "${GOPATH}" ] && [ -z "${GOROOT}" ]; then
  export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
fi
