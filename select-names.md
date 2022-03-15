# 1

```sql
SELECT name FROM world WHERE name LIKE 'Y%';
```

# 2

```sql
SELECT name FROM world WHERE name LIKE '%y';
```

# 3

```sql
SELECT name FROM world WHERE name LIKE '%x%';
```

# 4

```sql
SELECT name FROM world WHERE name LIKE '%land';
```

# 5

```sql
SELECT name FROM world WHERE name LIKE 'C%ia';
```

# 6

```sql
SELECT name FROM world WHERE name LIKE '%oo%';
```

# 7

```sql
SELECT name FROM world WHERE name LIKE '%a%a%a%';
```

# 8

```sql
SELECT name FROM world WHERE name LIKE '_t%' ORDER BY name;
```

# 9

```sql
SELECT name FROM world WHERE name LIKE '%o__o%';
```

# 10

```sql
SELECT name FROM world WHERE name LIKE '____';
```

# 11

```sql
SELECT name FROM world WHERE name = capital;
```

# 12

```sql
SELECT name FROM world WHERE capital = CONCAT(name, ' City');
```

# 13

```sql
SELECT capital, name FROM world WHERE capital LIKE CONCAT('%', name, '%');
```

# 14

```sql
SELECT capital, name FROM world
 WHERE capital LIKE CONCAT('%', name, '%') and LENGTH(capital) > LENGTH(name);
```

# 15

```sql
SELECT name, REPLACE(capital, name, '') FROM world
 WHERE capital LIKE CONCAT(name, '_%');
```













































