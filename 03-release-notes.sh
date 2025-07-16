PAT_VERSION_PREVIOUS=0.16.0
PAT_VERSION=0.17.0
PAT_MILESTONE=45

CHANGES=$(cat <<'EOF'
* Add Configuration page to web GUI
* Add optional message download prompting with size limits
* Add Reply All message action
* Major improvements to attachment handling:
  - Include attachments when forwarding messages
  - Add button to remove attachments
  - Fix attachments not retained when adding more to the same message
  - Improve attachment layout
* Templates:
  - Add support for multi-line prompt in text templates
  - Add CLI command 'templates' for managing forms/templates
  - Add support for template sequence numbers
  - Fix UTF-8 BOM handling in templates
  - Fix empty attached_text form values panic
* Fix Safari GPS timestamp issues
* Fix AGWPE timeout issues
* Fix FBB protocol turnover handling when all messages are deferred and/or rejected
EOF
)
export CHANGES

mkdir -p notes
envsubst > notes/releases.md <<EOF
<noscript><a href="https://liberapay.com/la5nta"><img alt="Donate using Liberapay" src="https://liberapay.com/assets/widgets/donate.svg"></a></noscript>

**Need help?** Check out the [Install FAQ](https://github.com/la5nta/pat/wiki/Install-FAQ).

## Linux
- Debian/Ubuntu/Mint:
  - **[pat_${PAT_VERSION}_linux_amd64.deb](https://github.com/la5nta/pat/releases/download/v${PAT_VERSION}/pat_${PAT_VERSION}_linux_amd64.deb)**
   - [pat_${PAT_VERSION}_linux_arm64.deb](https://github.com/la5nta/pat/releases/download/v${PAT_VERSION}/pat_${PAT_VERSION}_linux_arm64.deb) (Raspberry Pi 64-bit)
  - [pat_${PAT_VERSION}_linux_armhf.deb](https://github.com/la5nta/pat/releases/download/v${PAT_VERSION}/pat_${PAT_VERSION}_linux_armhf.deb) (Raspberry Pi 32-bit)
  - [pat_${PAT_VERSION}_linux_i386.deb](https://github.com/la5nta/pat/releases/download/v${PAT_VERSION}/pat_${PAT_VERSION}_linux_i386.deb)
- Other distributions:
  - **[pat_${PAT_VERSION}_linux_amd64.tar.gz](https://github.com/la5nta/pat/releases/download/v${PAT_VERSION}/pat_${PAT_VERSION}_linux_amd64.tar.gz)**
  - [pat_${PAT_VERSION}_linux_i386.tar.gz](https://github.com/la5nta/pat/releases/download/v${PAT_VERSION}/pat_${PAT_VERSION}_linux_i386.tar.gz)
  - [pat_${PAT_VERSION}_linux_arm64.tar.gz](https://github.com/la5nta/pat/releases/download/v${PAT_VERSION}/pat_${PAT_VERSION}_linux_arm64.tar.gz)

## Apple macOS
- **[pat_${PAT_VERSION}_darwin_amd64.pkg](https://github.com/la5nta/pat/releases/download/v${PAT_VERSION}/pat_${PAT_VERSION}_darwin_amd64.pkg)**

## Microsoft Windows
- **[pat_${PAT_VERSION}_windows_i386.zip](https://github.com/la5nta/pat/releases/download/v${PAT_VERSION}/pat_${PAT_VERSION}_windows_i386.zip)**

## Changes
$CHANGES


For more details, see [milestones/v${PAT_VERSION}](https://github.com/la5nta/pat/milestone/${PAT_MILESTONE}?closed=1) and [compare/v${PAT_VERSION_PREVIOUS}...v${PAT_VERSION}](https://github.com/la5nta/pat/compare/v${PAT_VERSION_PREVIOUS}...v${PAT_VERSION}).
EOF

envsubst > notes/email.txt <<EOF
TITLE: Pat v${PAT_VERSION} released
=====BODY START=====
Pat v${PAT_VERSION} has been released, and binaries for Linux, macOS and Windows are available at https://github.com/la5nta/pat/releases.

Changes:
$CHANGES

For more details, see milestones/v${PAT_VERSION}(https://github.com/la5nta/pat/milestone/${PAT_MILESTONE}?closed=1) and compare/v${PAT_VERSION_PREVIOUS}...v${PAT_VERSION}(https://github.com/la5nta/pat/compare/v${PAT_VERSION_PREVIOUS}...v${PAT_VERSION}).

-- 
73 de LA5NTA / Martin
=====BODY END=====
EOF
