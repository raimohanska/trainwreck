Trainwreck
=============

A starting point for an excercise for a Haskell Training held at Reaktor (reaktor.fi/en).

Please see [Agile Finland](http://confluence.agilefinland.com/pages/viewpage.action?pageId=11763960) 
for information on the actual training session.

The assignment
--------------

Create a train ticket reservation system that responds to simple JSON HTTP POST requests as below:

    POST /ticket/ {amount : 2}
    
    => [{ "car" : 1, "seat" : 2},{ "car" : 1, "seat" : 4}] 
    
    or in case not enough tickets available:
    
    => []