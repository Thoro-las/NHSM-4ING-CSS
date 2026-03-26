
// #subsection[Source Coding]
// The most important part of coding theory is achieving the most efficient reliable and secure coding. The first part is the focus of this section, by assigning a code from each symbol in $cal(X)$, we try to achieve the minimum bound possible of letters to send to transmit our message.
//
//
//
// #def(name: "Coding Function", ovcount: false)[
//   Let $c: cal(X) -> BB^+$, we call it a coding function, which takes characters of our set of symbols, and represent it a binary string in $BB^+$.
// ]
//
// To measure the efficiency of our coding function, we define the average code length, the less the average, the more efficient the transmission will be.
//
// #def(name: "Average Code Length", ovcount: false)[
//   Let $c: cal(X) -> BB^+$, a coding function, and consider the function $
//     overline(L): {c: cal(X) -> BB^+} &-> RR \ c &|-> overline(L)_c = sum_(x in cal(X)) p(x) dot.c |c(x)|
//   $
// ]
//
// #ooc[
//   #exm[
//     Take a horse race with $8$ horses, we want to send a message in binary that indicates which horse has won. And suppose that the probabilities of winning for each horse is as follows
//     #table(
//       columns: 9,
//       inset: (x: 2mm, y: 3mm),
//       align: center + horizon,
//       [Horse], ..range(1, 9).map(x => $#x$),
//       [Probability Of Winning], ..($1/2$, $1/4$, $1/8$, $1/64$, $1/64$, $1/64$, $1/64$, $1/64$).map(x => $display(#x)$)
//     )
//
//     If we just send the index of the winner horse, we get the following coding function
//
//     #table(
//       columns: 9,
//       align: center + horizon,
//       [Horse $i$], ..range(1, 9).map(x => $#x$),
//       [$c_1 (i)$], $000$, $001$, $010$, $011$, $100$, $101$, $110$, $111$
//     )
//
//     If we do it just blindly, we will need $3$ bits to describe all the possible winner horses from $000, 001, 010, dots.c, 110, 111$, calculating the average of description length we get $
//       overline(L)_(c_1) = sum_(x in X) 3 dot.c p(x) = 3 "bits"
//     $
//
//     Giving us an average of $3$ bits for the transmission to give exactly who horse is the winner. An aspect that we did not use in the previous part is how likely do horses win in this case, which we can use to improve the amount of bits that would be sent on the channel. Consider the distribution of the horses winning as follows
//
//     Notice that if we give a smaller message for the horses that are more probable to win, and less to horses that are less likely to win, then we can reduce some of the data that will be used to specify the winner. We take the following encoding
//
//     #table(
//       columns: 9,
//       inset: (x: 2mm, y: 3mm),
//       align: center + horizon,
//       [Horse $i$], ..range(1, 9).map(x => $#x$),
//       [$c_2(i)$], $0$, $10$, $110$, $1110$, $111100$, $111101$, $1111110$, $111111$
//     )
//
//     Now, we recalculate the average description length to get $   overline(L)_(c_2) = sum_(x in X) |c(x)| dot.c p(x) = 2 "bits"
//     $
//     we have reduced the average description length by $1$ bit. If we calculate the entropy in this case we get $H(X) = - sum_(x in X) P(x) dot.c log_2 P(x) = 1.83475$, we see that the reduced average code length is more than the entropy.
//   ]
// ]
//
// #section[Shannon Theorems]
// #ooc[
//   To prove Shannon theorems, we need the following statements.
//
//   #def(name: "Prefix Code", ovcount: false)[
//     A coding function $c: cal(X) -> BB^+$ is said to have the prefix property if $forall x, y in cal(X), forall u in BB^*, c(x) != c(y) u$.
//   ]
//
//   That is, no code is a prefix of another. An example of a prefix code is ${0, 10}$ while a non-prefix code is ${1, 10}$ since $1$ is a prefix of $10$. These codes are also called instantaneous codes, that is because given a binary string, even incomplete, one can know if it maps to a symbol or not. The proof of such statement is left for the reader.
//
//   #def(name: "Uniquely Decodable Code", ovcount: false)[
//     A coding function $c: cal(X) -> BB^+$ is said to be uniquely decodable if $c$ is injective, that is, each coding is unique to the symbol.
//   ]
//
//   #pro(ovcount: false)[
//     A uniquely decodable code $c$ can be turned into a prefix code $c'$ such that $forall i in [|1, n|], |c(x_i)| = |c'(x_i)|$.
//   ]
//
//   // #prf[
//   //   Let $c = {c_1, dots, c_m}$ be a uniquely Without loss of generality, consider 
//   // ]
//
//
//   #lem(name: "Kraft Inequality", ovcount: false)[
//     Let $X$ be a random variable with values in $cal(X)$, $c: cal(X) -> BB^+$ a coding function and $l(x) = |c(x)|$, then we have that $
//       sum_(i=1)^n 2^(- l(x_i)) <= 1
//     $
//   ]
//
// ]
//
// #thm(name: "Shannon's First Theorem", ovcount: false)[
//   Let $X$ be a random variable with values in $cal(X)$, for any coding function $c: cal(X) -> BB^+$ we have $
//     overline(L)_c >= H(X)
//   $
// ]
//
// Huffman's algorithm provides a systematic way to construct an optimal prefix code, where symbols with higher probability should have shorter code words, and achieves a lower bound of average coding weight.
//
// #alg(name: "Huffman", ovcount: false)[
//   + Sort symbols by probability in descending order.
//   + Combine the two smallest probabilities.
//   + Repeat until one node remains.
//   + Build the tree.
//   + Assign 0 and 1 to branches.
//   + Read codewords.
//   + Compute the average code length.
// ]
//
// #exm[
// ]
//
// The closer this value is to the entropy, the more efficient the compression is, using Huffman coding, the message is compressed, meaning that fewer bits are needed on average per symbol compared to a fixed length code such code is called optimal code which is a code that minimizes average code length. In source coding, our goal was to remove redundancy in order to compress the message. Now, we move to a different problem, what happens when the channel is noisy?
//
// #subsection[Noise And Errors]
// To reduce the probability of error, we need to make the sent message more robust to disturbances through channel coding.
//
//
// #thm(name: "Shannon's Second Theorem", ovcount: false)[
//   For any noisy channel, there exists a code that allows reliable transmission if the rate is less than the channel capacity.
// ]
//

