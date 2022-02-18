gen:
	protoc product/product.proto --go_out=. --go-grpc_out=.

init:
	git submodule add https://github.com/googleapis/googleapis.git

genapi:
	protoc -I=./user \
	-I=./googleapis \
	-I=${GOPATH}/src/github.com/envoyproxy/protoc-gen-validate \
	-I=${GOPATH}/src/github.com/grpc-ecosystem/grpc-gateway \
	--go_out=.  \
	--go-grpc_out=. \
	--grpc-gateway_out=logtostderr=true:. \
	--openapiv2_out=logtostderr=true,use_go_templates=true:./api \
	--validate_out="lang=go:." \
	user/user.proto