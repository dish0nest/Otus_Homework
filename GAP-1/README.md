# ДЗ №1 
### Установка и настройка Prometheus, использование exporters

### ДИСКЛЕЙМЕР: так как CMS развернуть не получилось, была написана программа на Python, которая отдает IP-адрес контейнера и записывает его в БД

## Схема стенда:
![alt text](https://github.com/dish0nest/Otus_Homework/blob/main/GAP-1/%D0%A1%D1%85%D0%B5%D0%BC%D0%B0%20%D1%81%D1%82%D0%B5%D0%BD%D0%B4%D0%B0.jpg)

## Компоненты стенда
```
В стенд входят:
  1. 2 Виртуальные машины(ОС Debian 12)
    - Execute
    - Monitoring
  2. В VM Execute входят:
    - Nginx (вне Docker контура)
    - Node-exporter (вне Docker контура)
    - Docker контур:
      - Nginx-exporter
      - cAdvisor
      - blackbox-exporter
      - 2 контейнера с приложением
      - СУБД postgresql
      - psql-exporter
  3. В VM Monitoring входит:
    - Prometheus (Docker)
```

## Шаги выполнения
```
```
