# Readme
##Problem Statement
A group of web pages has been classified by associating a list of keywords, given in decreasing
order of relevance, with each page (i.e., the order of keywords is from the most specific keyword
to the least specific). For example, on the TopGear web site a page on reviews of Ford cars may
have the keywords: Ford, Car, Review in that order; the most relevant keyword is Ford.
Queries also include a list of keywords, again from most to least relevant. For example, in a
query consisting of the keyword Ford followed by the keyword Car, Ford is more important than
Car.
In this problem you are to determine the top five (or fewer) pages that match each of an arbitrary
number of queries

##Given

To determine the strength of the relationship between a query and a web page, assume the
keywords for each page and each query are assigned integer weights, in descending
order, starting with N, where N is the maximum number of keywords allowed for a web page and
query.

The strength of the relationship is the sum of the products of the weights associated with
each keyword that appears both in the web page list and the query list.

##Example

Following web pages and keyword lists:
Page 1: Ford, Car, Review
Page 2:Toyota, Car
Page 3: Car, Ford
For N equal 8, a query with keywords Ford and Car in that order yields the following strength
ratings.
Page 1: (8x8 + 7x7) = 113
Page 2: (7x7) = 49
Page 3: (7x8) = 56.
Similarly, a query with keywords Ford and Review yields the following strength ratings.
Page 1: (8x8 + 7x6) = 106
Page 2: = 0
Page 3: (8x7) = 56

##when
Input data consist of one line for each web page and query.A line consists of a code letter
followed by a list of keywords. Code letters P and Q denote a page and a query. Code letters and
keywords are separated by at least one space. Ps and Qs may occur in any order.
Pages are added sequentially starting with page one. The case of characters in the keywords is
not significant. Each query also has of a list of between one and 8 keywords. Again, case being
insignificant for keywords. Number the queries sequentially starting with on

###Sample Input
```
P Ford Car Review
P Review Car
P Review Ford
P Toyota Car
P Honda Car
P Car
Q Ford
Q Car
Q Review
Q Ford Review
Q Ford Car
Q cooking French
```
##Then
###Output for the Sample Input
```
Q1: P1 P3
Q2: P6 P1 P2 P4 P5
Q3: P2 P3 P1
Q4: P3 P1 P2
Q5: P1 P3 P6 P2 P4
Q6:
```
##Instruction to execute this program

### Install Dependencies

	bundle install

### Run tests

	rake spec

### Run executable

	bin/search -f data.in


### sample execution:
$ bin/search.rb -f data.in
```
Q1: P1 P3
Q3: P3 P2 P1
Q4: P2 P3 P1
Q2: P6 P4 P5 P2 P1
Q5: P6 P3 P4 P2 P5 P1
```
