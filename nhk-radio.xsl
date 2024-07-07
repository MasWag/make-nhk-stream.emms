<?xml version="1.0" ?>
<!-- 
     Brief: A XSLT file to convert the NHK Radio configuration XML file to the format supported by EMMS.
     Author: Masaki Waga
     Date: 2024-07-07
     Usage: xsltproc nhk-radio.xsl config_web.xml > streams.emms
     Note: The input file is available at https://www.nhk.or.jp/radio/config/config_web.xml
     License: MIT License
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:output method="text" encoding="UTF-8" />
  <xsl:template match="/radiru_config">
    <xsl:text>;;; This is an EMMS playlist file&#10;&#10;</xsl:text>
    <xsl:text>(</xsl:text>
    <xsl:apply-templates select="./stream_url/data"/>
    <xsl:text>)</xsl:text>
  </xsl:template>
  <xsl:template match="data">
    <!-- Output the Radio 1 configuration -->
    <xsl:text>(*track* (type . streamlist) (metadata "NHK R1 </xsl:text>
    <xsl:value-of select="normalize-space(./areajp)" />
    <xsl:text>" "</xsl:text>
    <xsl:value-of select="normalize-space(./r1hls)" />
    <xsl:text>" 1 streamlist) (name . "</xsl:text>
    <xsl:value-of select="normalize-space(./r1hls)" />
    <xsl:text>"))&#10;</xsl:text>
    <!-- Output the Radio 2 configuration -->
    <xsl:text>(*track* (type . streamlist) (metadata "NHK R2 </xsl:text>
    <xsl:value-of select="normalize-space(./areajp)" />
    <xsl:text>" "</xsl:text>
    <xsl:value-of select="normalize-space(./r2hls)" />
    <xsl:text>" 1 streamlist) (name . "</xsl:text>
    <xsl:value-of select="normalize-space(./r2hls)" />
    <xsl:text>"))&#10;</xsl:text>
    <!-- Output the FM configuration -->
    <xsl:text>(*track* (type . streamlist) (metadata "NHK FM </xsl:text>
    <xsl:value-of select="normalize-space(./areajp)" />
    <xsl:text>" "</xsl:text>
    <xsl:value-of select="normalize-space(./fmhls)" />
    <xsl:text>" 1 streamlist) (name . "</xsl:text>
    <xsl:value-of select="normalize-space(./fmhls)" />
    <xsl:text>"))&#10;</xsl:text>    
  </xsl:template>
</xsl:stylesheet>
