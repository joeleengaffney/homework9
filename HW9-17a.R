#bernoulli r.v. count
n = 64
#true p
p = .3
#create the bernoulli r.v.
X = rbinom(n, 1, p)
#count how many times there was success
Sn = sum(X == 1)
#divide by n to get the experimental probability
p.hat = Sn/n
print(p.hat)

#type I
epsilon.1 = .1225
lowbound.1 = p.hat - epsilon.1
upbound.1 = p.hat + epsilon.1
if ({p > lowbound.1} & {p < upbound.1}) {
  print("type I contains true p")
}else {print("type I does not contain true p")}

#type II
epsilon.2 = .245*sqrt(p.hat*(1-p.hat))
lowbound.2 = p.hat - epsilon.2
upbound.2 = p.hat + epsilon.2
if ({p > lowbound.2} & {p < upbound.2}) {
  print("type II contains true p")
}else {print("type II does not contain true p")}