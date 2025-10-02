#import "@THR/Wide:1.0.0": *
#show: template

#mainpage([Chipsets Programming], [HOCINE], [HADIOUCHE Azouaou])

#chap("Introduction")[
  This course will be talking about programming cards, both from the car and software that comes with it, and how to implement card instructions. Cards are used in multiple domains to simplify authentification or access to services such as identification and bank services.
]

#sect("Types & Architecture")
Cards can be divided into two types: contact cards and contactless cards. One uses contact and has its chipset contact exposed directly and contactless uses radio frequencies for the communication. In the contact cards, there were two implementations of the inside circuitry, either using logic gates that are printed directly or using a micro-processor to be able to reprogram them.
