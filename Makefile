-include .make.env

# ──────────────────────────────
# 📁 Directory Paths
# ──────────────────────────────
PROTO_SRC := ./proto
GO_GENERATED:= ./go

# ──────────────────────────────
# 📜 Generate & Clean Protobuf
# ──────────────────────────────
gen-proto:
	echo "Generating Protobuf files..."
	mkdir -p $(GO_GENERATED)
	protoc \
		-I $(PROTO_SRC) \
		--go_out=paths=source_relative:$(GO_GENERATED) \
		--go-grpc_out=paths=source_relative:$(GO_GENERATED) \
		--validate_out=lang=go,paths=source_relative:$(GO_GENERATED) \
		$$(find $(PROTO_SRC) -name "*.proto")


clean-proto:
	echo "Cleaning generated Protobuf files..."
	rm -rf $(GO_GENERATED)/*
