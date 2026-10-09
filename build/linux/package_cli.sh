#!/usr/bin/env bash
# shellcheck disable=SC1091,SC2153

set -ex

if [[ "${CI_BUILD}" == "no" ]]; then
  exit 1
fi

# include common functions
. ./utils.sh

mkdir -p assets

tar -xzf ./vscode.tar.gz

cd vscode || { echo "'vscode' dir not found"; exit 1; }

if [[ "${OS_NAME}" == "alpine" ]]; then
  VSCODE_PLATFORM="alpine"
else
  VSCODE_PLATFORM="linux"
fi

APPLICATION_NAME="$( node -p "require(\"./product.json\").applicationName" )"

mkdir -p "../VSCode-linux-${VSCODE_ARCH}/bin"

. ../build_cli.sh

cd ..

mkdir -p "vscode-cli"

cd "vscode-cli"

cp "../VSCode-linux-${VSCODE_ARCH}/bin/${TUNNEL_APPLICATION_NAME}" "${APPLICATION_NAME}"

tar czf "../assets/${APP_NAME_LC}-cli-${VSCODE_PLATFORM}-${VSCODE_ARCH}-${RELEASE_VERSION}.tar.gz" .

cd ..

./prepare_checksums.sh
