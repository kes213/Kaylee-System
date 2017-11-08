<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns="http://purl.oclc.org/dsdl/schematron">
    <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
  <pattern>
     <rule context="tei:persName">
         <report test="starts-with(., ' ')">Element begins with a whitespace.</report>     
     </rule>
     <rule context="tei:person">
         <assert test="starts-with(@xml:id, tei:surname)">The beginning of a historical figure's xml:id must be his or her surname (paternal or married acceptable).</assert>
          <!-- Here, I also tried an assert test using test="starts-with(., surname)" with the context attribute value set as @xml:id instead of person, 
              but the rule did not work that way either. -->
         <assert test="number(tei:birth[tokenize(., '-')[1]]) lt number(tei:death[tokenize(., '-')[1]])"></assert>
          <report test="matches(tei:forename | tei:surname | tei:placeName, '[A-Z]')">Proper names should start with a capital letter.</report>
     </rule>
     <rule context="@xml:id">
         <assert test="not(contains(., ' '))">This attribute cannot contain white spaces.</assert>
         <report test="starts-with(., '#')">An attribute cannot contain hashtags.</report>
     </rule>
     <rule context="@ref">
         <assert test="starts-with(., '#')">Attributes that refer to an xml:id need to have a hashtag before it.</assert>
     </rule>
  </pattern>
</schema>

<!-- I'm struggling again to get my schematron to fire with my XML document. I know that the first <assert> rule is working, but I can't get any of the others
to work. I'm sure I'm having issues with the content of my @test attributes, but overall I'm still very confused. These rules were my best guess, and because I had
questions about so many of the questions, I felt uncomfortable posting my answers on the GitHub for assistance. I wanted to come to your office hours, but 
I couldn't this week because I had class or prior commitments that I needed to attend to.-->

<!-- I read your notes on the file that I originally submitted and edited the version that I had saved on my local computer so I didn't need to re-associate my
schema. I think it's working now . . .? Thanks for giving me a chance to resubmit it!-->