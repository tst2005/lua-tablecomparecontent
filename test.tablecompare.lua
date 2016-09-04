local table_eq = require "tablecompare"

local t1={} local t2={}
assert( table_eq({a={x={t1,t2}}, b=t2}, {a={x={t1,t2}}, b=t2}) )

local t1 = {}

t1[t1]=t1
t1.x = {[t1] = {1, 2, 3}}

local t2 = {}
local t3 = {}

t2[t3]=t2
t3[t2]=t3
t2.x = {[t3] = {1, 2, 3}}
t3.x = {[t2] = {1, 2, 3}}

assert(table_eq(t1, t2) == false)
assert(table_eq(t2, t3) == true)

local t4 = {}
t4[{}] = 1
t4["1"] = {}

local t5 = {}
local t6 = {}
t5[t6] = 1
t5["1"] = t6

assert(table_eq(t4, t5) == false)
