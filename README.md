# Rudir

Как использовать:

Сохраните код в файл, например, `rudir.rb`.
    Создайте файл со списком слов (wordlist), например, `wordlist.txt`, который будет содержать пути для брутфорс-атаки, по одному на строку.
    Запустите скрипт, указав URL целевого веб-сервера и путь к файлу со списком слов:

`ruby rudir.rb http://example.com wordlist.txt`

Пример содержимого файла wordlist.txt:

`admin
login
secret
hidden
backup`

Этот скрипт будет проверять каждый путь из файла `wordlist.txt` на целевом веб-сервере и выводить результаты. Если путь существует и возвращает статус код 200, скрипт сообщит об этом.

Этот пример является базовым и может быть улучшен для поддержки дополнительных функций, таких как обработка ошибок, параллельное выполнение запросов и т.д.
