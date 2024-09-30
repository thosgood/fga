<?xml version="1.0"?>
<!-- SPDX-License-Identifier: CC0-1.0 -->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:f="http://www.jonmsterling.com/jms-005P.xml"
  xmlns:html="http://www.w3.org/1999/xhtml">

  <xsl:output method="text" encoding="utf-8" indent="yes" doctype-public="" doctype-system="" />

  <xsl:template match="/f:tree/f:frontmatter">
  </xsl:template>

  <xsl:template match="/f:tree/f:backmatter">
  </xsl:template>

  <xsl:template match="/f:tree/f:mainmatter/f:p">
  </xsl:template>

  <xsl:template match="f:anchor|f:addr|f:route|f:title|f:date|f:authors|f:taxon">
  </xsl:template>

  <xsl:template match="/f:tree/f:mainmatter/f:tree/f:frontmatter/f:meta[not(@name='bibtex')]">
  </xsl:template>

  <xsl:template match="/f:tree/f:mainmatter/f:tree/f:frontmatter/f:meta[@name='bibtex']">
    <xsl:apply-templates />
    <xsl:text>

    </xsl:text>
  </xsl:template>

</xsl:stylesheet>