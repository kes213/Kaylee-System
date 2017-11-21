<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg">
    <xsl:output method="xml" indent="yes"/>

<!-- Defining Variables -->

<xsl:variable name="numPoems" select="count(//poem)"/>
<xsl:variable name="Xspacer" select="100"/>
<xsl:variable name="puncMax" select="max(for $i in $McKayColl return count($i//descendant::punc))"/>
<xsl:variable name="Yspacer" select="50"/>

<xsl:template match="/">
    <svg xmlns="http://www.w3.org/2000/svg">
        <g>
            
<!-- Scratchpad -->
<xsl:comment>The number of McKay poems is: 
<xsl:value-of select="$numPoems"/>
</xsl:comment>
<xsl:comment>The max width of the X-axis is:
<xsl:value-of select="$numPoems * $Xspacer"/>
</xsl:comment>




    </g>        
  </svg>
</xsl:template>  
</xsl:stylesheet>