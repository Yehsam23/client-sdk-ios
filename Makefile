PROTO_SOURCE=../protocol

proto: protoc protoc-swift
	protoc --swift_out=Sources/LiveKit/proto -I=${PROTO_SOURCE} \
		${PROTO_SOURCE}/livekit_models.proto \
		${PROTO_SOURCE}/livekit_rtc.proto

docs: swift-docs
	swift doc generate Sources/LiveKit \
		--module-name "LiveKit iOS Client" \
		--output Documentation \
		--format html \
		--base-url /client-sdk-ios

protoc-swift:
ifeq (, $(shell which protoc-gen-swift))
	brew install swift-protobuf
endif

protoc:
ifeq (, $(shell which protoc))
	brew install protobuf
endif

swift-docs:
ifeq (, $(shell which swift-doc))
	brew install swiftdocorg/formulae/swift-doc
endif
