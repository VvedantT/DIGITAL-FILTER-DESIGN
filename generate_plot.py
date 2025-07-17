import numpy as np
import matplotlib.pyplot as plt

def todecimal(x,bits):
    assert len(x)<=bits
    n=int(x,2)
    s=1<<(bits -1)
    return (n&s-1)-(n&s)
#number of coef
tap=8

N1=8
N2=16
N3=32

real_coeff=(1/tap);

coeff_bit=np.binary_repr(int(real_coeff*(2**(N1-1))),N1)
todecimal(coeff_bit,N1)/(2**(N1-1))

timeVector=np.linspace(0,2*np.pi,100)
output=np.sin(2*timeVector)+np.cos(3*timeVector)+0.3*np.random.randn(len(timeVector))

plt.plot(output)
plt.show()

list1=[]
for number in output:
    list1.append(np.binary_repr(int(number*(2**(N1-1))),N2))

with open("input.data",'w') as file:
    for number in list1:
        file.write(number+'\n')
        

read_b=[]

with open("save.data") as file:
    for line in file :
        read_b.append(line.rstrip('\n'))

n_l=[]
for by in read_b:
    if(by=="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"):
        continue
    n_l.append(todecimal(by,N3)/(2**(2*(N1-1))))


plt.plot(output,color='blue',linewidth=3,label='Original signal')
plt.plot(n_l,color='red',linewidth=3,label='filtered signal')
plt.legend()
plt.savefig('results.png',dpi=600)
plt.show()
