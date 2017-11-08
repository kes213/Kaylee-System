<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns="http://purl.oclc.org/dsdl/schematron">
<pattern>
    <rule context="results">
        <assert test="sum(place) eq 100">Percentages must add up to 100.</assert>
        <assert test="count(place) eq 4">There should be no more than 4 locations.</assert>
        <report test="count(distinct-values(place/@name)) lt 4"> Locations should not be used more than once in this document.</report>
    </rule>
    <rule context="place">
        <assert test="number() ge 0 and number() lt 100"> A voting percentage must be between 0 and 100.</assert>
    </rule>
       
</pattern>   
    
</schema>

<!-- After finishing this exercise, I feel as though I understand how to write a rule using Schematron; what is causing problems seems to be forming the
    XPath expressions to put in the test attribute value. I would really like another explanation of how to write Xpath expressions in Schematron to avoid 
    another low score on future homework assignments. These are the best guesses I could come up with for this assignment, after taking in examples across
    the links provided, and while this document is well-formed, I know that only the first one performs the job within the XML document that it is supposed to. 
a-->
<!--2017-10-16 ebb: Thanks for explaining where you had difficulty! This is exactly the same problem I had, too, when I wrote my first Schematron exercise, so I definitely understand! How do you know where to set the context for a test, and how do you work out the XPath to accompany it? This is different from writing XPath expressions in the XPath window, because you set a context locally **inside** the document. So, one good thing you noticed here is that you could set a context on the child <place> element itself: that is actually the key information you need here, that and understanding which XPath functions need to operate over a **collection** of XML nodes and which ones need to operate **one at a time** on each node to test something. The functions sum() and count() and distinct-vaues() all need to be running over multiple nodes for them to make sense. (You could count() one thing and always get one, but that's not usually what we want: we use these to check a collection of nodes.) So it makes sense to take the sum(place) here, because there are multiple child place elements that have numbers inside. You also want to count() multiple things from the context of a position that **contains** them, so your count of distinct-values() of all the @name attributes should be rewritten up in the rule for results. 
    Now, the number() functions, like name() and contains() and matches(), they all fire in relation to **one single node at a time**, and Schematron (and the XPath window, too) will give you a clue when you're using these over more than one: They'll say "A sequence of more than one item is not allowed...etc etc": and that's your clue that OH! you need to reset your context: In Schematron, you move to a new rule with an @context set on place, and this time each Schematron test will look at each individual place node. Would you like to try rewriting these rules, before we reveal the answers? (You can resubmit this before class if you're here a little early!) 
-->