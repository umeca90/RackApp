Rack приложение которое отвечает на  
URL GET /time
с параметром строки запроса format и возвращать время в заданном формате. 

Пример: GET-запрос  
/time?format=year%2Cmonth%2Cday
вернет ответ с типом text/plain и телом 1970-01-01.


Доступные форматы времени: year, month, day, hour, minute, second
Форматы передаются в параметре строки запроса format в любом порядке
