<!-- order: 30 -->

# Other Resources

## Table of Contents

- [What are reh and reh-web archives?](#reh)
- [Where does the CLI download the server from?](#download-url-templates)

## <a id="reh"></a>What are reh and reh-web archives?

- Remote Host (`reh`) is the server component for remote ssh/wsl which runs it on a "remote" computer and makes that remote computer accessible via VSCodium.
- Web Host (`reh-web`) is the server component of the command `codium serve-web` which runs it locally and makes VSCodium accessible via a browser.

## <a id="download-url-templates"></a>Where does the CLI download the server from?

The CLI uses the same URL templates as `product.json`:
- `serverDownloadUrlTemplate`: the `reh` archive
- `cliDownloadUrlTemplate`: the CLI archive

They can be overridden with the environment variables `VSCODE_CLI_SERVER_DOWNLOAD_URL_TEMPLATE` and `VSCODE_CLI_CLI_DOWNLOAD_URL_TEMPLATE`.<br />
The placeholders are `${os}`, `${arch}`, `${commit}`, `${quality}`, `${release}` and `${version}`.
