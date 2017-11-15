<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg">
    <xsl:output method="xml" indent="yes"/>
    
    <!-- X-axis global variables -->
    <xsl:variable name="numQuestions" select="count(//fs[f[@select='Yes']]/f/string)"/>
    <xsl:variable name="barWidth" select="10"/>
    <xsl:variable name="Xspacer" select="50"/>
    <xsl:variable name="max_Xvalue" select="$numQuestions * ($barWidth + $Xspacer)"/>
    
    <!-- Y-axis global variables -->
    <xsl:variable name="Yspacer" select="-5"/>
    <xsl:variable name="max_Yvalue" select="$Yspacer * 100"/>
    
    <xsl:template match="/">
    <!-- XSLT Scratchpad -->
    <xsl:comment>The total number of questions with yes/no (or yes but fined) responses is:
        <xsl:value-of select="$numQuestions"/>
        The maximum X value is:
        <xsl:value-of select="$max_Xvalue"/>
    </xsl:comment>
    <xsl:comment>The maximum Y value is: 
        <xsl:value-of select="$max_Yvalue"/>
    </xsl:comment>
    
    <svg width="800" height="700" viewBox="0 0 1000 1000">
        <g transform="translate(60 700)">
            
         <!-- X-axis Line -->   
         <line x1="0" y1="0" x2="{$max_Xvalue + $Xspacer}" y2="0" stroke="black" stroke-width="2"/>  
         
         <!-- Y-axis Line -->
         <line x1="0" y1="0" x2="0" y2="{$max_Yvalue}" stroke="black" stroke-width="2"/> 
         
         <!-- Hashmarks on Y-axis -->
         <xsl:for-each select="1 to 10">
             <xsl:variable name="Yaxis_HashLocator" select=". * 10 * $Yspacer"/>
             <xsl:variable name="Yaxis_HashName" select=". * 10"/>
            <text x="-30" y="{$Yaxis_HashLocator}" text-anchor="middle"><xsl:value-of select="$Yaxis_HashName"/></text>
            <line x1="0" y1="{$Yaxis_HashLocator}" x2="{$max_Xvalue + $Xspacer}" y2="{$Yaxis_HashLocator}" stroke="green" stroke-width="1" stroke-dasharray="10"/>
         </xsl:for-each>
            
         <xsl:for-each select="//fs[f[@select='Yes']]">
            <xsl:variable name="xPos" select="position() * ($Xspacer + $barWidth)"/>
             <xsl:comment>What is the value of $Xpos> 
             <xsl:value-of select="$xPos"/></xsl:comment>
         <!-- X-axis Labels -->
             <text x="{$xPos}" y="10" style="font-family:sans-serif;font-size:20px;writing-mode:tb" fill="black"><xsl:value-of select="descendant::string"/></text>
        <!-- Calculating Percentages -->
           
           <xsl:variable name="YesCount" select="descendant::f[@select='Yes']/count(@n)"/>
           <xsl:variable name="TotalCount" select="descendant::f/sum(@n)"/>
           <xsl:variable name="YesPercent">
               <xsl:choose>
                   <xsl:when test="$TotalCount = 0">0</xsl:when>
                   <xsl:otherwise>
                       <xsl:value-of select="$YesCount div $TotalCount * 100"/>
                   </xsl:otherwise>
               </xsl:choose>
           </xsl:variable>
           <xsl:comment>The percentage of "Yes" answers is:
           <xsl:value-of select="$YesPercent"/>
           </xsl:comment>
         </xsl:for-each>
        </g>
    </svg>
    </xsl:template>


</xsl:stylesheet>