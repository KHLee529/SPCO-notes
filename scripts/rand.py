#!/usr/bin/env python3
import random
mu = int(input())
sigma = int(input())

for i in range(5):
    print(f"{random.gauss(mu,sigma)}\t{random.gauss(mu,sigma)}")

