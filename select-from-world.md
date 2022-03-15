# 1

```sql
SELECT name, continent, population FROM world;
```

# 2

```sql
SELECT name FROM world WHERE population >= 200000000;
```

# 3

```sql
SELECT name, gdp / population FROM world WHERE population >= 200000000;
```

# 4

```sql
SELECT name, population / 1000000 FROM world WHERE continent = 'South America';
```

# 5

```sql
SELECT name, population FROM world WHERE name IN ('France', 'Germany', 'Italy');
```

# 6

```sql
SELECT name FROM world WHERE name LIKE '%United%';
```

# 7

```sql
SELECT name, population, area FROM world WHERE area > 3000000 OR population > 250000000;
```

# 8

```sql
SELECT name, population, area FROM world WHERE area > 3000000 XOR population > 250000000;
```

# 9

```sql
SELECT name, ROUND(population / 1000000, 2), ROUND(gdp / 1000000000, 2) FROM world WHERE continent = 'South America';
```

# 10

```sql
SELECT name, ROUND(gdp / population / 1000) * 1000 FROM world WHERE gdp >= 1000000000000;
```

# 11

```sql
SELECT name, capital FROM world WHERE LENGTH(name) = LENGTH(capital);
```

# 12

```sql
SELECT name, capital FROM world WHERE LEFT(name, 1) = LEFT(capital, 1) AND name != capital;
```

# 13

```sql
SELECT name FROM world
 WHERE name NOT LIKE '% %' AND name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%';
```