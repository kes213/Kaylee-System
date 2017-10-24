<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    version="3.0">
    
    <xsl:mode on-no-match="shallow-copy"/> 
    
    <xsl:output method="xml" encoding="utf-8" doctype-system="about:legacy-compat" omit-xml-declaration="yes"/> 
    
    <xsl:template match="emph">
        <hi rend="italics">
            <xsl:apply-templates/>
        </hi>
    </xsl:template>
    
    <xsl:template match="head/l">
        <xsl:apply-templates/>
        <lb/>
    </xsl:template>
    <xsl:template match="div[@type='book']">
        <div type="book" n="{count(preceding-sibling::div[@type='book']) + 1}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="div[@type='chapter']">
        <div type="chapter" n="{count(preceding-sibling::div[@type='chapter']) + 1}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
</xsl:stylesheet>