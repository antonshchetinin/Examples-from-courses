Схема БД состоит из четырех таблиц:
Product(maker, model, type)
PC(code, model, speed, ram, hd, cd, price)
Laptop(code, model, speed, ram, hd, price, screen)
Printer(code, model, color, type, price)
Таблица Product представляет производителя (maker), номер модели (model) и тип ('PC' - ПК, 'Laptop' - ПК-блокнот или 'Printer' - принтер). Предполагается, что номера моделей в таблице Product уникальны для всех производителей и типов продуктов. В таблице PC для каждого ПК, однозначно определяемого уникальным кодом – code, указаны модель – model (внешний ключ к таблице Product), скорость - speed (процессора в мегагерцах), объем памяти - ram (в мегабайтах), размер диска - hd (в гигабайтах), скорость считывающего устройства - cd (например, '4x') и цена - price. Таблица Laptop аналогична таблице РС за исключением того, что вместо скорости CD содержит размер экрана -screen (в дюймах). В таблице Printer для каждой модели принтера указывается, является ли он цветным - color ('y', если цветной), тип принтера - type (лазерный – 'Laser', струйный – 'Jet' или матричный – 'Matrix') и цена - price.

1.Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd
SELECT DISTINCT model, speed, hd 
FROM PC 
WHERE price < 500
2. Найдите производителей принтеров. Вывести: maker
select distinct maker from product
where type = 'printer'
3. Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 д
select model,ram,screen from laptop
where price > 1000
4. Найдите все записи таблицы Printer для цветных принтеров.
select * from printer 
where color = 'y'
5. Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.
Select model, speed, hd from pc
where (cd ='12x' or cd = '24x') and price < 600
6. Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.
Select distinct p.maker, l.speed 
from laptop as l
join product as p 
on p.model = l.model
where l.hd  >= 10
7. Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).
SELECT DISTINCT P.MODEL, PC.PRICE FROM PRODUCT AS P
JOIN PC 
ON PC.MODEL = P.MODEL WHERE MAKER = 'B'
UNION
SELECT DISTINCT P.MODEL, L.PRICE FROM PRODUCT AS P
JOIN LAPTOP AS L
ON L.MODEL = P.MODEL WHERE MAKER = 'B' 
UNION
SELECT DISTINCT P.MODEL, PR.PRICE FROM PRODUCT AS P
JOIN PRINTER AS PR
ON PR.MODEL = P.MODEL WHERE MAKER = 'B'
8. Найдите производителя, выпускающего ПК, но не ПК-блокноты.
SELECT DISTINCT maker FROM product 
WHERE type='pc' 
and maker NOT IN(SELECT maker FROM product WHERE type='laptop')
9. Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker
SELECT DISTINCT P.MAKER FROM PRODUCT AS P 
LEFT JOIN PC
ON PC.MODEL = P.MODEL WHERE PC.SPEED >= 450
10. Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price
SELECT MODEL, PRICE FROM PRINTER
WHERE PRICE = (SELECT MAX(PRICE)FROM PRINTER)
11. Найдите среднюю скорость ПК.
SELECT AVG(SPEED) FROM PC
12. Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.
SELECT AVG(SPEED) FROM LAPTOP
WHERE PRICE > 1000
13. Найдите среднюю скорость ПК, выпущенных производителем A.
SELECT AVG(SPEED) FROM PC
JOIN PRODUCT AS P
ON PC.MODEL = P.MODEL WHERE P.MAKER = 'A'
14. Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.
SELECT C.CLASS, S.NAME, C.COUNTRY FROM CLASSES AS C
JOIN SHIPS AS S
ON S.CLASS = C.CLASS WHERE NUMGUNS >= 10
15. Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD
SELECT HD FROM PC GROUP BY HD HAVING COUNT(MODEL)>=2
16.Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.
SELECT DISTINCT p1.model, p2.model, p1.speed, p1.ram
FROM pc p1, pc p2
WHERE p1.speed = p2.speed AND p1.ram = p2.ram AND p1.model > p2.model
17.Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК.
Вывести: type, model, speed
SELECT DISTINCT TYPE, L.MODEL, SPEED 
FROM LAPTOP AS L
JOIN PRODUCT AS P
ON P.MODEL = L.MODEL
WHERE SPEED < ALL (SELECT SPEED FROM PC)
18.Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price
SELECT DISTINCT PROD.MAKER,PRIN.PRICE 
FROM PRODUCT AS PROD
JOIN PRINTER AS PRIN ON PROD.MODEL = PRIN.MODEL 
WHERE PRIN.PRICE = (SELECT MIN(PRICE) FROM PRINTER 
WHERE COLOR = 'Y') AND PRIN.COLOR ='Y'
19. Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов.
Вывести: maker, средний размер экрана.
SELECT P.MAKER, AVG(SCREEN)
FROM PRODUCT AS P
JOIN LAPTOP AS L
ON P.MODEL = L.MODEL
GROUP BY MAKER
20. Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: Maker, число моделей ПК.
SELECT MAKER, COUNT(MODEL) AS COUNT_MODEL
FROM PRODUCT
WHERE TYPE = 'PC'
GROUP BY PRODUCT.MAKER
HAVING COUNT (DISTINCT MODEL) >= 3
