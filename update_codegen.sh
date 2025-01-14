#! /usr/bin/env nix-shell
#! nix-shell -i bash -p mockgen  -p "(callPackage ./sqlc.nix {})"
#! nix-shell --quiet

# This script updates the mocks with mockgen

set -euox pipefail

sqlc generate
mockgen -source ./src/server/deps.go -destination ./src/server/mocks/deps.go -package mocks
mockgen -source ./src/db/querier.go -destination ./src/server/mocks/querier.go -package mocks
