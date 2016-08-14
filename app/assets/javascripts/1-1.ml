(*
-------------------------------
   LIST: LIST
   basic LIFO list
-------------------------------
*)

datatype LIST = 
   New  
   | ins of LIST * int * int ;

fun size (New) = 0
  | size (ins(L,e,i)) = size(L)+1
;

fun empty (New) = true
  | empty (ins(L,e,i)) = false
;

exception EmptyList;

fun get(New, i) = raise EmptyList
| get(ins(L,e,k), i) = if (i=k) then e
  else if (i<k) then get(L,i)
  else get(L, i-1)
;

fun find(New, e) = raise EmptyList
| find(ins(L,e,i), f) = if (e=f)
                          then i
                        else if find(L,F) < i
                          then find(L,F)
                        else 
                          find(L,f) + 1
;

fun rem(New,i) = New
| rem(ins(L,e,K), i) = if (i=k)
                        then L
                       else if (i<k)
                        then ins(rem(L,i-1), e, k)
                       else 
                        ins(rem(L,i), e, k-1)
;


(*== test stacks =====================*)

val b1 = ins(New,1,0);
val b2 = ins(b1,2,1);
val b3 = ins(b2,3,2);

size(New) = 0;
size(b1) = 1;
empty(New) = true;
empty(b3) = false;
get(b1, 0) = 1;
get(ins(b2,5,2),2) = 5;
get(ins(b2,5,2),1) = 2;
get(ins(b2,5,1),2) = 2;
