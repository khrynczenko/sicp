A process that has to remebera chain of deffered operations
is called a *recursive process*. Each recursive call requires
to make some memory of earlier calls so later they can be ran.

A process that does not grow or shrink but uses state to
keep track of what is happening is called iterative process.

A recursive process is not the same things as recursive procedure.
Recursive procedure is a procedure that refers in its defintion to
itself by name. It does not mean that its structure is "growing and shrinking"
(requires to maintain memory of deferred operations).

So the recursive procedure might be in fact describing iterative process.
So the interpreter needs only constant amount of memory to perform evaluation.
This is a case of so called *tail-recursive* procedures.


