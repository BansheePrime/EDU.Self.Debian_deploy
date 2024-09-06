# Please read before "oops!" or FAQ

## My goal

Bash script with choices for preparing .iso file with Debian VM and preseeded installation answers.

### Steps to follow

1. Remaster the .iso image
2. Create .iso file with initrd preseeding with a file named preseed.cfg is included in the root directory of the initrd.
3. Specify a checksum for the file (needs to be a md5sum).

### TODO

1. [] **Choice:** Target or Download fresh debian *{your_version}-netinst.iso*
2. []
3. []
4. []

### Files list

- `example-preseed.txt` general seed **excluded** from git
- `seed_prep_live_system.txt` seed from live system **excluded** from git

#### Sources used

- Appendix B. Automating the installation using preseeding
<https://www.debian.org/releases/bookworm/amd64/apbs02.en.html>
