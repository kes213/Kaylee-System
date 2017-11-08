<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg">
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:variable name="numChap" select="count(//chapter)"/>
    <xsl:variable name="sp_alice" select="max(//chapter/count(descendant::q[@sp='alice']))"/>
    <xsl:variable name="Xinterval" select="50"/>
    <xsl:variable name="Yinterval" select="-5"/>
    <xsl:variable name="Pos" select="position()"/>
    
    <xsl:template match="/">   
        <xsl:comment>
        X-axis calculation ~ The number of chapters is: <xsl:value-of select="$numChap"/>
        To spread the data evenly, the x-axis should be this long: <xsl:value-of select="$Xinterval * $numChap"/>
        </xsl:comment>
        <xsl:comment>
        Y-axis calculation ~ The maximum number of times Alice speaks in one chapter is: <xsl:value-of select="$sp_alice"/>
        To spread the graph upwards evenly, the y-asis should be this long: <xsl:value-of select="$Yinterval * $sp_alice"/>
        </xsl:comment>
  
       <svg xmlns="http://www.w3.org/2000/svg" width="800" height="4500" viewBox="0 0 800 4500">
            <g transform="translate(200 600)">
                <!-- X-axis -->
            <line x1="0" y1="0" x2="{$numChap * $Xinterval}" y2="0" stroke="black" stroke-width="4"/>
                
                <!-- Y-axis -->
            <line x1="0" y1="0" x2="0" y2="{$sp_alice * $Yinterval + $Yinterval}" stroke="black" stroke-width="4"/>
            
             <!-- Graph Title -->
                <text x="50" y="-400" fill="blue" style="font-family:sans-serif;font-size:30px">A Line Graph of When Alice Speaks</text>
           
              <!-- X-axis Label -->  
                <text x="275" y="100" fill="blue" style="font-family:sans-serif;font-size:20px">Chapter</text>
                <xsl:for-each select="//chapter"> 
                    
               <!-- Y-axis Label -->
                    <text x="-50" y="-375" fill="blue" style="font-family:sans-serif;font-size:30px;writing-mode:tb">Number of Times Alice Speaks</text>
               <!-- X-axis Chapter Numbers -->
        <xsl:variable name="Pos" select="position()"/>  
        <xsl:comment>What is the value of $Pos? <xsl:value-of select="$Pos"/>
        </xsl:comment>
            <text x="{$Pos * $Xinterval - $Xinterval div 2}" y="50" fill="blue" text-anchor="middle">
                <xsl:apply-templates select="@which"/>
            </text>
               
           <!-- Dots plotted on the graph -->  
            <circle cx="{$Pos * $Xinterval - $Xinterval div 2}" cy="{count(descendant::q[@sp='alice']) * $Yinterval}" r="4" fill="blue"/>
           
           <!-- Lines to connect dots -->
          <!-- <xsl:if test="$Pos ne last()">
               <line x1="{$Pos * $Xinterval - $Xinterval div 2}" y1="{count(descendant::q[@sp='alice']) * $Yinterval}" 
                   x2="{$Pos + 1 * $Xinterval - $Xinterval div 2}" y2="{@which + 1}" stroke="black" stroke-width="2"/>
           </xsl:if>-->
           </xsl:for-each>
            </g>
        </svg>
    </xsl:template>
</xsl:stylesheet>

<!-- I've toggled off my attempt at getting the lines between the dots because I know they aren't right, 
but I figured i would leave it there anyway to show that I did attempt it.-->