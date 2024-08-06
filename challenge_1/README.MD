## Enunciado Challenge 1 ##

<p> Modify the Ping Helm Chart to deploy the application on the following restric-
tions:</p>

    • Isolate specific node groups forbidding the pods scheduling in this node groups.

    • Ensure that a pod will not be scheduled on a node that already has a pod of the same type.

    • Pods are deployed across different availability zones.