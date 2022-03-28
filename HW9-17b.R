#bernoulli r.v. count
n = 64
#true p
p = .3
i = 1
#k is counting number for success for type I
k = 0
#j is counting number for success for type II
j = 0
#create the bernoulli r.v.
while (i<=1000) {
X = rbinom(n, 1, p)
#count how many times there was success
Sn = sum(X == 1)
#divide by n to get the experimental probability
p.hat = Sn/n

#type I
epsilon.1 = .1225
lowbound.1 = p.hat - epsilon.1
upbound.1 = p.hat + epsilon.1
if ({p > lowbound.1} & {p < upbound.1}) {
  k=k+1
}

#type II
epsilon.2 = .245*sqrt(p.hat*(1-p.hat))
lowbound.2 = p.hat - epsilon.2
upbound.2 = p.hat + epsilon.2
if ({p > lowbound.2} & {p < upbound.2}) {
  j=j+1
}
#go to next simulation
i = i+1
}
prob.1 = (k/1000)*100
prob.2 = (j/1000)*100
print(prob.1)
print(prob.2)
if ({prob.1 >= 95} & {prob.2 < 95}) {
  print("Type I is successful at least 95% of time")
}
if ({prob.1 < 95} & {prob.2 >= 95}) {
  print("Type II is successful at least 95% of time")
}
if ({prob.1 >= 95} & {prob.2 >= 95}) {
  print("both were successful at least 95% of time")
}
if ({prob.1 < 95} & {prob.2 < 95}) {
  print("neither were more than 95% successful")
}