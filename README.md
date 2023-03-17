# RELATIONAL-LOGIC-SEARCH-ENGINE-ON-HEALTH-CARE
Extended Boolean retrieval (EBR) models were proposed nearly three decades ago, but have had little practical impact, despite their significant advantages compared to either ranked keyword or pure Boolean retrieval. 
Relational Logic Search Engine On Healthcare 
Abstract:
Extended Boolean retrieval (EBR) models were proposed nearly three decades ago, but have had little practical impact, despite their significant advantages compared to either ranked keyword or pure Boolean retrieval. In particular, EBR models produce meaningful rankings; their query model allows the representation of complex concepts in an and–or format; and they are scrutable, in that the score assigned to a document depends solely on the content of that document, unaffected by any collection statistics or other external factors. These characteristics make EBR models attractive in domains typified by medical and legal searching, where the emphasis is on iterative development of reproducible complex queries of dozens or even hundreds of terms. However, EBR is much more computationally expensive than the alternatives. We consider the implementation of the p-norm approach to EBR, and demonstrate that ideas used in the max-score and wand exact optimization techniques for ranked keyword retrieval can be adapted to allow selective bypass of documents via a low-cost screening process for this and similar retrieval models. We also propose term independent bounds that are able to further reduce the number of score calculations for short, simple queries under the extended Boolean retrieval model. Together, these methods yield an overall saving of 50% to 80% of the evaluation cost on test queries drawn from biomedical search.
Existing System:

In our Existing System, A significant amount of work has been devoted to the evaluation of top-k queries in databases. Provide a survey of the research on top-k queries on relational databases. This line of work typically handles the aggregation of attribute values of objects in the case where the attribute values lie in different sources or in a single source. For example, Bruno etc. Consider the problem of ordering a set of restaurants by distance and price. They present an optimal sequence of random or sequential accesses on the sources (e.g., Zagat for price and Mapquest for distance) in order to compute the top- k restaurants. Since the concept of top-k is typically a heuristic itself for locating the most interesting items in the database, Theobald et al.Describe a framework for generating an approximate top-k answer, with some probabilistic guarantees. In our work, we use the same idea; the main and crucial difference is that we only have “random access” to the underlying database (i.e., through querying), and no “sorted access.” Theobald et al. assumed that at least one source provides “sorted access” to the underlying content.

Disadvantages:

The queries are often much more complex, involving dozens or even hundreds of terms; there is a great deal of reformulation and reevaluation and the user evaluation process typically involves hundreds or thousands of answer documents rather than a mere handful.

System Architecture:

 


Proposed System:

We present a scoring method for EBR models that decouples document scoring from the inverted list evaluation strategy, allowing free optimization of the latter. The method incurs partial sorting overhead, but, at the same time, reduces the number of query nodes that have to be considered in order to score a document. We show experimentally that overall the gains are greater than the costs.

 We adopt ideas from the max-score and wand algorithms and generalize them to be applicable in the context of models with hierarchical query specifications and monotonic score aggregation functions. Further, we show that the p-norm EBR model is an instance of such models and that performance gains can be attained that are similar to the ones available
when evaluating ranked queries.

Term-independent bounds are proposed, which complement the bounds obtained from max-score. Taken alone, term-independent bounds can be employed in the wand algorithm, also reducing the number of score evaluations. Further, in conjunction with the adaption of max-score, this novel heuristic is able to short-circuit the scoring of documents.

Advantages:
Complex information need descriptions: Boolean queries can be used to express complex concepts.

Composability & Re-use: Boolean filters and concepts can be recombined into larger query tree structures.

Reproducibility: Scoring of a document only depends on the document itself, not statistics of the whole collection, and can be reproduced with knowledge of the query.

Scrutability: Properties of retrieved documents can be understood simply by inspection of the query.

Strictness: Strict inclusion and exclusion criteria are inherently supported, for instance, based on metadata.


Implementation Modules:
1.	Using Boolean Condition(AND)
2.	Using Boolean Condition(OR)
3.	Using Boolean Condition(NOT)
4.	Top k-Query Search


Using AND Condition:

We define the novel problem of applying ranking on top of sources with no ranking capabilities by exploiting their query interface.

For instance, if the user query is Q= [anemia, diabetes, sclerosis], then we can submit to the data source queries q1 = [anemia AND diabetes AND sclerosis], q2 = [anemia AND diabetes AND NOT sclerosis], q3 = [diabetes OR sclerosis], and so on. The returned results are guaranteed to match the Boolean conditions but the documents are not expected to be ranked in any useful manner.

Using OR Condition:

We describe sampling strategies for estimating the relevance of the documents retrieved by different keyword queries. We present a static sampling approach and a dynamic sampling approach that simultaneously executes the query, estimates the parameters required for efficient query execution, and compensates for the biases in the sampling process.
For instance, if the user query is Q= [anemia, diabetes, sclerosis], then we can submit to the data source queries q1 = [anemia AND diabetes AND sclerosis], q2 = [anemia AND diabetes AND NOT sclerosis], q3 = [diabetes OR sclerosis], and so on. The returned results are guaranteed to match the Boolean conditions but the documents are not expected to be ranked in any useful manner.

Using NOT Condition:

We present algorithms that, given a user confidence input, retrieve a minimal number of results from the source through submitting high selectivity (conjunctive) queries, so that the user’s confidence requirement is satisfied.

For instance, if the user query is Q= [anemia, diabetes, sclerosis], then we can submit to the data source queries q1 = [anemia AND diabetes AND sclerosis], q2 = [anemia AND diabetes AND NOT sclerosis], q3 = [diabetes OR sclerosis], and so on. The returned results are guaranteed to match the Boolean conditions but the documents are not expected to be ranked in any useful manner.

Top K-Query Search:

Our overall goal is to figure out during our querying process, how many of the top-k relevant documents we have retrieved and how many are still unretrieved in the database. Unfortunately, we cannot be absolutely certain about these numbers unless we retrieve and score all documents: an expensive operation. Alternatively, we can build a probabilistic model of score distributions and examine, probabilistically, how many good documents are still not retrieved. We describe our approach here.
Algorithm used:
CalcScore() – Query Tree Scoring
Input: T, a set of numbered terminals, and B, a set of numbered
internal nodes; collectively they form N, a set of tree
nodes describing a Boolean expression
1 S   fTi 2 T j Ti:s > 0g
2 while S 6= fN1g do
3 Determine largest parent node index:
j = arg maxjfSi 2 S j Bj = Si:P g
4 Determine active clauses of Bj in S:
A = fSi 2 S j Si:P = Bjg
5 Split A into the two sets As=1 and A0<s<1
6 if jA0<s<1j = 0 then
7 Lookup pre-computed score when operands are
all-binary:
Bj :s   TableLookup(Bj ; jAs=1j)
8 else if Bj :type = OR then
Bj :s  
_
1
jBj :Cj
􀀀
jAs=1j +
P
i (A0<s<1
i :s)Bj :p__ 1
Bj :p
9
10 else if Bj :type = AND then
11 ks=0   jBj :Cj 􀀀 jA0<s<1j 􀀀 jAs=1j
Bj :s   1 􀀀
_
1
jBj :Cj
􀀀
ks=0 +
P
i (1 􀀀 A0<s<1
i :s)Bj :p__ 1
Bj :p
12
13 end
14 Remove the processed nodes from S, and add their parent:
S   S 􀀀 A + fBjg
15 end
16 return N1:s

System Configuration:-
H/W System Configuration:-

        Processor               -    Pentium –III
Speed                                -    1.1 Ghz
RAM                                 -    256 MB(min)
Hard Disk                          -   20 GB
Floppy Drive                     -    1.44 MB
Key Board                         -    Standard Windows Keyboard
Mouse                                -    Two or Three Button Mouse
Monitor                              -    SVGA
 S/W System Configuration:-
	Operating System            :Windows95/98/2000/XP 
	Application  Server    :   Tomcat5.0/6.X                               		
	Front End                          :   HTML, Java, Jsp
	 Scripts                                :   JavaScript.
	Server side Script             :   Java Server Pages.
	Database Connectivity      :   Mysql.


