Trainwreck
=============

A starting point for an excercise for a Haskell Training held at Reaktor (reaktor.fi/en).

The assignment
--------------

Create a train ticket reservation system that responds to simple JSON HTTP POST requests as below:

    POST /ticket/ {amount : 2}
    
    => [{ "car" : 1, "seat" : 2},{ "car" : 1, "seat" : 4}] 
    
    or in case not enough tickets available:
    
    => []