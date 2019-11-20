# Go (https://golang.org/ )
if [[ -x "$(command -v go)" ]];
then
  export GOPATH=$HOME/.go
  export GOROOT="$(brew --prefix golang)/libexec"
fi
