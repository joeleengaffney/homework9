#counting number for simulation of full run
m = 1
#counting number for over 95% type I
l = 0
#counting number for over 95% type II
z = 0
while (m<=100) {
#bernoulli r.v. count
n = 64
#probability
p = .3
i = 1
#k is counting number for success for type I
k = 0
#j is counting number for success for type II
j = 0
while (i<=1000) {
  #create the bernoulli r.v.
  X = rbinom(n, 1, p)
  #count how many times there was success
  Sn = sum(X == 1)
  #divide by n to get the experimental probability
  p.hat = Sn/n
  
  #type I
  epsilon.1 = .1225
  lowbound.1 = p.hat - epsilon.1
  upbound.1 = p.hat + epsilon.1
  #if true p exists within the bounds
  if ({p > lowbound.1} & {p < upbound.1}) {
    k=k+1
  }
  
  #type II
  epsilon.2 = .245*sqrt(p.hat*(1-p.hat))
  lowbound.2 = p.hat - epsilon.2
  upbound.2 = p.hat + epsilon.2
  #if true p exists within the bounds
  if ({p > lowbound.2} & {p < upbound.2}) {
    j=j+1
  }
  #go to next simulation
  i = i+1
}
prob.1 = (k/1000)*100
prob.2 = (j/1000)*100
if (prob.1 >= 95) {
  l = l+1
}
if (prob.2 >= 95) {
  z=z+1
}
m=m+1
}
print(l/100)
print(z/100)
print("Type I is almost always within the 95% CI, whereas Type II has a poor probability of landing in that CI")