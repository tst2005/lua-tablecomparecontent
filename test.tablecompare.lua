local table_eq = require "tablecompare"

t1={}
t2={}
print(
table_eq({a={x={t1,t2}}, b=t2}, {a={x={t1,t2}}, b=t2})
)
