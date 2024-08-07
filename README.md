# Rudir

Как использовать:

Сохраните код в файл, например, `rudir.rb`.
    Создайте файл со списком слов (wordlist), например, `wordlist.txt`, который будет содержать пути для брутфорс-атаки, по одному на строку.
    Запустите скрипт, указав URL целевого веб-сервера и путь к файлу со списком слов:

`ruby rudir.rb https://example.ru wordlist.txt`

Пример содержимого файла wordlist.txt:

`admin`
`login`
`secret`
`hidden`
`backup`

Этот скрипт будет проверять каждый путь из файла `wordlist.txt` на целевом веб-сервере и выводить результаты. Если путь существует и возвращает статус код 200, скрипт сообщит об этом.

Важные замечания:    

1. SSL/TLS: Скрипт автоматически включает поддержку SSL, если URL начинается с `https`.
2. Обработка ошибок: В реальных условиях может потребоваться добавить обработку ошибок, таких как таймауты и ошибки сети.
3. Параллельное выполнение: Для ускорения процесса можно использовать параллельное выполнение запросов, например, с помощью библиотеки `concurrent-ruby`.
