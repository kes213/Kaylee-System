<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg">
    <xsl:output method="xml" indent="yes"/>
<!--2017-11-21 ebb: Kaylee, I got the XSLT working by removing the TEI line in the xsl:stylesheet element (since you're not using TEI). I was thinking about meaningful calculations for studying punctuation in your poems, and tried an experiment with number of commas per unit line. That's not a percentage, but comes out usually as a low number.  -->

<xsl:template match="/">
    
    <!-- Defining Global Variables -->  
    <xsl:variable name="numPoems" select="count(//poem)"/>
    <xsl:variable name="Xspacer" select="100"/>
    <xsl:variable name="puncMax" select="max(for $i in //poem return count($i//descendant::punc))"/>
    <xsl:variable name="commaPerLineMax" select="max(for $i in //poem return count($i//punc[@type='comma']) div count($i//l))"/>
    <!-- ebb: I added this to see a the max ratio of **commas per line** in the collection, in case this looks like it might be worth plotting.-->
    <xsl:variable name="poemMaxCommaPerLine" select="//poem[count(descendant::punc[@type='comma']) div count(descendant::l) = max(for $i in //poem return count($i//punc[@type='comma']) div count($i//l))]/title"/>
<!--ebb: I was curious to see which poem had the highest ratio of commas per line, so I wrote the variable above to get me its title.  -->
  
    <xsl:variable name="Yspacer" select="50"/>
    <!--counting punctuation types -->
    <xsl:variable name="globalCommas" select="count(//punc[@type='comma'])"/>
    <!--ebb: Try global punctuation total, and try calculating percentage of globalCommas against the total punctuation.
    
    You can also generate LOCAL percentages against totals.  
    -->
    <svg xmlns="http://www.w3.org/2000/svg">
        <g>
            
            
<!-- Scratchpad -->   
<xsl:comment>The number of McKay poems is: 
<xsl:value-of select="$numPoems"/>
</xsl:comment>
<xsl:comment>The max width of the X-axis is:
<xsl:value-of select="$numPoems * $Xspacer"/>
</xsl:comment>
 <xsl:comment>What's the highest ratio of commas per line in this collection? <xsl:value-of select="$commaPerLineMax"/> . Which poem has this ratio? <xsl:value-of select="$poemMaxCommaPerLine"/></xsl:comment>  
   
   
   
 <xsl:comment>Local poem-by-poem processing:</xsl:comment>
            
 <xsl:for-each select="descendant::poem">
     <xsl:variable name="poemTitle" select="title"/>
     <xsl:value-of select="$poemTitle"/>
     <xsl:variable name="localCommas" select="count(descendant::punc[@type='comma'])"/>
     <xsl:comment>Raw count of commas in this poem: <xsl:value-of select="$localCommas"/></xsl:comment>
     <xsl:variable name="countLines" select="count(descendant::l)"/>
     <xsl:comment>Number of lines in this poem: <xsl:value-of select="$countLines"/></xsl:comment>
     <!--ebb: It occured to me (after you left) that you might want to consider how long each poem is relative to the others. Another way (besides percentage) to get a sense of the relative proportion of punctuation is to look at the number of commas per unit line, just as simple division. That's not a percentage, and we'd expect these numbers to be pretty low. Let's take a look at the ratio of commas per line here:-->
     <xsl:variable name="ratioCommasPerLine" select="$localCommas div $countLines"/>
     <xsl:comment>Commas per Line: <xsl:value-of select="$ratioCommasPerLine"/></xsl:comment>
  
     <xsl:variable name="percentGlobalComma" select="$localCommas div $globalCommas * 100"/>
     <xsl:comment>Percentage of commas in this poem vs. the entire collection's comma count: <xsl:value-of select="$percentGlobalComma"/>.</xsl:comment>
     <!-- THINK CAREFULLY ABOUT WHAT THESE MEAN ABOUT THE POEMS.-->
     
     <!--Calculate a local total for all punc in the poem, and get the comma percentage from that.  -->
     
     <xsl:variable name="localTotalPunc" select="count(descendant::punc)"/>
         <!--You can use the above variable to get you a LOCALIZED percentage of any kind of punctuation, as in the proportion of semicolons to ALL punctuation in the poem. -->
         
     <xsl:variable name="percentLocalComma" select="$localCommas div $localTotalPunc * 100"/>
     <xsl:comment>Percentage of commas vs. total punctuation in this poem: <xsl:value-of select="$percentLocalComma"/>
     </xsl:comment>
     
     
 </xsl:for-each>           

    </g>        
  </svg>
</xsl:template>  
</xsl:stylesheet>