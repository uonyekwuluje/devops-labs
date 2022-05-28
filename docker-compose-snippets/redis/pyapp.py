#!/usr/bin/env python3
import redis
try:
    r = redis.from_url('redis://localhost:6379')
    print(r.ping())
except:
    print("Connection Error")
