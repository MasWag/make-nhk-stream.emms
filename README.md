make-nhk-stream.emms
====================

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](./LICENSE)

This is an XSLT stylesheet to convert the NHK Radio configuration XML file to the format supported by EMMS. Notice that the generated file must be enclosed with parentheses.

The input file is available at https://www.nhk.or.jp/radio/config/config_web.xml.

Prerequisites
-------------

- An XSLT processor such as xsltproc

Usage
-----

1. If `streams.emms` is not generated yet, please execute `M-x emms-streams-install` first.
2. Run the following command:

```sh
wget https://www.nhk.or.jp/radio/config/config_web.xml
xsltproc nhk-radio.xsl config_web.xml > streams.emms
```

3. Copy the contents of the generated file to `streams.emms` under `~/.emacs.d`.
