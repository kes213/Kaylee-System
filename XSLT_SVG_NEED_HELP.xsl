<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg">
    <xsl:output method="xml" indent="yes"/>

<!-- Defining Global Variables -->

<xsl:variable name="numPoems" select="count(//poem)"/>
<xsl:variable name="Xspacer" select="100"/>
<xsl:variable name="puncMax" select="max(for $i in //poem return count($i//descendant::punc))"/>
<xsl:variable name="Yspacer" select="50"/>
 <!--counting punctuation types -->
    <xsl:variable name="globalCommas" select="count(//punc[@type='comma'])"/>
    <!--ebb: Try global punctuation total, and try calculating percentage of globalCommas against the total punctuation.
    
    You can also generate LOCAL percentages against totals. 
    
    -->

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
            
 <xsl:for-each select="descendant::poem">
     
     <xsl:variable name="localCommas" select="count(descendant::punc[@type='comma'])"/>
     
     <xsl:variable name="percentGlobalComma" select="$localCommas div $globalCommas * 100"/>
     <xsl:comment><xsl:value-of select="$percentGlobalComma"/></xsl:comment>
     <!-- THINK CAREFULLY ABOUT WHAT THESE MEAN ABOUT THE POEMS-->
     
     <!--Calculate a local total for all punc in the poem, and get the comma percentage from that.  -->
     
     <xsl:variable name="localTotalPunc" select="count(descendant::punc)"/>
         <!--You can use the above variable to get you a LOCALIZED percentage of any kind of punctuation, as in the proportion of semicolons to ALL punc in the poem. -->
         
     <xsl:variable name="percentLocalComma" select="$localCommas div $localTotalPunc * 100"/>
     <xsl:comment><xsl:value-of select="$percentLocalComma"/></xsl:comment>
     
     
   
     
 </xsl:for-each>           




    </g>        
  </svg>
</xsl:template>  
</xsl:stylesheet>