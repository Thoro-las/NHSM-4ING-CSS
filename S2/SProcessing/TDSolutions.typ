#import "@THR/Document:1.0.0": *
#show: template.with(cover: (hide-page: true))

#let sgn = math.op("sgn")
#let rect = math.op("rect")
#let tri = math.op("tri")
#let ig = math.op("ig")
#let rep = math.op("rep")

#ctitle[1.4 Exercises]
#exr(ovcount: false)[
  Calculate the integrals, the average value and the repetition of each of the following functions.
  $
    x_1 (t) = A rect(t/Delta) quad y_1 (t) = A tri(t/Delta)
  $
]

+ $x_1 (t) = A rect(t/Delta)$
  - Integral: #h(1fr) $
    integral_(-infinity)^infinity x_1 (t) dif t = A integral_(-infinity)^infinity rect(t/Delta) dif t = A Delta
  $
  - Average Value: $
    overline(x_1) = lim_(T -> infinity) 1/T integral_(-T/2)^(T/2) x(t) dif t = lim_(T -> infinity) (A Delta)/T = 0
  $
  - Repetition: $
    x_2(t) = (rep_T (x_1)) (t) = x_1 (t) convolve 
  $
