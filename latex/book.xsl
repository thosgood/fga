<?xml version="1.0"?>
<!-- SPDX-License-Identifier: CC0-1.0 -->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:f="http://www.jonmsterling.com/jms-005P.xml"
  xmlns:html="http://www.w3.org/1999/xhtml">

  <xsl:output method="text" encoding="utf-8" indent="yes" doctype-public="" doctype-system="" />
  
  <xsl:template match="/">
    <xsl:apply-templates select="/f:tree/f:frontmatter" mode="top" />
    <xsl:apply-templates select="/f:tree/f:mainmatter" />
  </xsl:template>

  <xsl:template match="f:frontmatter" mode="top">
    <xsl:text>\part{</xsl:text>
    <xsl:apply-templates select="f:title" />
    <xsl:text>}</xsl:text>
    <xsl:text>\label{</xsl:text>
    <xsl:apply-templates select="f:addr" />
    <xsl:text>}</xsl:text>
    <xsl:text>\thispagestyle{fancy}</xsl:text>
  </xsl:template>

  <xsl:template match="/f:tree/f:mainmatter/f:tree[not(f:frontmatter/f:taxon)]/f:frontmatter/f:title">
    <xsl:text>\chapter{</xsl:text>
    <xsl:apply-templates />
    <xsl:text>}</xsl:text>
    <xsl:text>\thispagestyle{fancy}</xsl:text>
  </xsl:template>

  <xsl:template match="/f:tree/f:mainmatter/f:tree/f:mainmatter/f:tree[not(f:frontmatter/f:taxon)]/f:frontmatter/f:title">
    <xsl:text>\section{</xsl:text>
    <xsl:apply-templates />
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="/f:tree/f:mainmatter/f:tree/f:mainmatter/f:tree/f:mainmatter/f:tree[not(f:frontmatter/f:taxon)]/f:frontmatter/f:title">
    <xsl:text>\subsection{</xsl:text>
    <xsl:apply-templates />
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="f:tree[not(f:frontmatter/f:taxon)]">
    <xsl:apply-templates select="f:frontmatter/f:title" />
    <xsl:text>\label{</xsl:text>
    <xsl:value-of select="f:frontmatter/f:addr" />
    <xsl:text>}</xsl:text>
    <xsl:apply-templates select="f:mainmatter" />
  </xsl:template>

  <xsl:template match="f:taxon[text()='Original']">
    <xsl:text>original</xsl:text>
  </xsl:template>

  <xsl:template match="f:taxon[text()='Definition']">
    <xsl:text>definition</xsl:text>
  </xsl:template>

  <xsl:template match="f:taxon[text()='Theorem']">
    <xsl:text>theorem</xsl:text>
  </xsl:template>

  <xsl:template match="f:taxon[text()='Lemma']">
    <xsl:text>lemma</xsl:text>
  </xsl:template>

  <xsl:template match="f:taxon[text()='Proposition']">
    <xsl:text>proposition</xsl:text>
  </xsl:template>

  <xsl:template match="f:taxon[text()='Corollary']">
    <xsl:text>corollary</xsl:text>
  </xsl:template>

  <xsl:template match="f:taxon[text()='Statement']">
    <xsl:text>statement</xsl:text>
  </xsl:template>

  <xsl:template match="f:taxon[text()='Example']">
    <xsl:text>example</xsl:text>
  </xsl:template>

  <xsl:template match="f:taxon[text()='Remark']">
    <xsl:text>remark</xsl:text>
  </xsl:template>

  <xsl:template match="f:taxon[text()='Remarks']">
    <xsl:text>remarks</xsl:text>
  </xsl:template>

  <xsl:template match="f:taxon[text()='Scholium']">
    <xsl:text>scholium</xsl:text>
  </xsl:template>

  <xsl:template match="f:taxon[text()='Conjecture']">
    <xsl:text>conjecture</xsl:text>
  </xsl:template>

  <xsl:template match="f:taxon[text()='Equation']">
    <xsl:text>eqn</xsl:text>
  </xsl:template>

  <xsl:template match="f:tree[f:frontmatter/f:taxon[text()='Proof']]">
    <xsl:text>\begin{proof}</xsl:text>
    <xsl:apply-templates select="f:mainmatter" />
    <xsl:text>\end{proof}</xsl:text>
  </xsl:template>

  <xsl:template match="f:tree[f:frontmatter/f:taxon[not(text()='Proof')]]">
    <xsl:text>\begin{</xsl:text>
    <xsl:apply-templates select="f:frontmatter/f:taxon" />
    <xsl:text>}</xsl:text>
    <xsl:if test="f:frontmatter/f:title">
      <xsl:text>[{</xsl:text>
      <xsl:apply-templates select="f:frontmatter/f:title" />
      <xsl:text>}]</xsl:text>
    </xsl:if>
    <xsl:text>{</xsl:text>
    <xsl:apply-templates select="f:frontmatter/f:number" />
    <xsl:text>}</xsl:text>
    <xsl:if test="f:frontmatter/f:number">
      <xsl:text>\setnumber{</xsl:text>
      <xsl:apply-templates select="f:frontmatter/f:number" />
      <xsl:text>}</xsl:text>
    </xsl:if>
    <xsl:if test="f:frontmatter/f:addr[@type='user']">
      <xsl:text>\label{</xsl:text>
      <xsl:value-of select="f:frontmatter/f:addr" />
      <xsl:text>}</xsl:text>
    </xsl:if>
    <xsl:text>\skipsinglepar</xsl:text>
    <xsl:apply-templates select="f:mainmatter" />
    <xsl:text>\end{</xsl:text>
    <xsl:apply-templates select="f:frontmatter/f:taxon" />
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="f:mainmatter">
    <xsl:apply-templates select="f:p|f:tex|f:ol|f:ul|f:tree|html:ol|html:li" />
  </xsl:template>

  <xsl:template match="f:p">
    <xsl:text>\par{}</xsl:text>
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="f:strong">
    <xsl:text>\textbf{</xsl:text>
    <xsl:apply-templates />
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="f:em">
    <xsl:text>\emph{</xsl:text>
    <xsl:apply-templates />
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="f:code">
    <xsl:text>\url{</xsl:text>
    <xsl:apply-templates />
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="f:tex[not(@display='block')]">
    <xsl:text>\(</xsl:text>
    <xsl:apply-templates />
    <xsl:text>\)</xsl:text>
  </xsl:template>

  <xsl:template match="f:tex[@display='block']">
    <xsl:text>\[</xsl:text>
    <xsl:apply-templates />
    <xsl:if test="parent::f:mainmatter/parent::f:tree/f:frontmatter/f:taxon[text()='Proof'] and position()=last()">
      <xsl:text>\qedhere</xsl:text>
    </xsl:if>
    <xsl:text>\]</xsl:text>
  </xsl:template>

  <xsl:template match="f:ol">
    <xsl:text>\begin{enumerate}</xsl:text>
    <xsl:apply-templates />
    <xsl:text>\end{enumerate}</xsl:text>
  </xsl:template>

  <xsl:template match="f:ul">
    <xsl:text>\begin{itemize}</xsl:text>
    <xsl:apply-templates />
    <xsl:text>\end{itemize}</xsl:text>
  </xsl:template>

  <xsl:template match="f:li">
    <xsl:text>\item{}</xsl:text>
    <xsl:apply-templates />
    <xsl:if test="(parent::f:ol/parent::f:mainmatter/parent::f:tree/f:frontmatter/f:taxon[text()='Proof'] or parent::f:ul/parent::f:mainmatter/parent::f:tree/f:frontmatter/f:taxon[text()='Proof']) and position()=last()">
      <xsl:text>\qedhere</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="html:ol">
    <xsl:text>\begin{enumerate}</xsl:text>
    <xsl:apply-templates />
    <xsl:text>\end{enumerate}</xsl:text>
  </xsl:template>

  <xsl:template match="html:li">
    <xsl:text>\item[</xsl:text>
    <xsl:variable name="firstSplit" select="substring-after(@style, ': &quot;')" />
    <xsl:variable name="secondSplit" select="substring-before($firstSplit, ' &quot;')" /> 
    <xsl:value-of select="$secondSplit" />
    <xsl:text>]</xsl:text>
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="f:ref[@taxon]">
    <xsl:text>\hyperref[</xsl:text>
    <xsl:value-of select="@addr" />
    <xsl:text>]{</xsl:text>
    <xsl:value-of select="@taxon" />
    <xsl:text>~</xsl:text>
    <xsl:text>\ref*{</xsl:text>
    <xsl:value-of select="@addr" />
    <xsl:text>}}</xsl:text>
  </xsl:template>

  <xsl:template match="f:ref[not(@taxon)]">
    <xsl:text>\cref{</xsl:text>
    <xsl:value-of select="@addr" />
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="f:link[@type='local']">
    <xsl:text>\hyperref[</xsl:text>
    <xsl:value-of select="@addr" />
    <xsl:text>]{</xsl:text>
    <xsl:apply-templates />
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="f:block">
    <xsl:text>\begin{proof}</xsl:text>
    <xsl:apply-templates />
    <xsl:text>\end{proof}</xsl:text>
  </xsl:template>

  <xsl:template match="f:headline" />

  <xsl:template match="f:embedded-tex">
    <xsl:text>\begin{center}</xsl:text>
    <xsl:text>\includestandalone{</xsl:text>
    <xsl:value-of select="@hash" />
    <xsl:text>}</xsl:text>
    <xsl:text>\end{center}</xsl:text>
  </xsl:template>

</xsl:stylesheet>