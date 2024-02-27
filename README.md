### Подготовка рабочего пространства
- Устанавливаем Docker, VSCode с расширением Dev Containers
- Открываем VSCode и разворачиваем создаём пространство для разработки
  - Ctrl + Shift + P (Вызываем командную паллету)
  - Вводим "Dev Containers" и выбираем "New Dev Container"
  - Вводим "Rails" Выбираем "Ruby on Rails & Postgres"
  - Выбираем Create Dev Container и пишем название, по умолчанию "ruby-rails-postgres"
  - Ждём завершения установки, можно открыть логи через терминал
    - Потом лучше сделать так: `sudo chown -R vscode:vscode /usr/local/lib/ruby`

### Создаём репозиторий
- Открываем Github и создаём репозиторий https://github.com/new (без создания `.gitignore`)
- Открываем доступ
   - Генерируем ssh ключ, в терминале нашего рабочего пространства `ssh-keygen -t rsa`
   - Выводим содержимое ssh ключа `cat ~/.ssh/id_rsa.pub` в консоль и копируем
   - Добавляем ключ в настройках github репозитория ["Settings"-"Deploy Keys - Add Deploy Key"](https://github.com/ArtemBoltunov/ruby-blank-example/settings/keys/new). (Ставим галку "Allow write access")
- Клонируем репозиторий
  - Выполняем `git clone git@github.com:ArtemBoltunov/ruby-blank-example.git`
    - Если ошибка: "ssh: Could not resolve hostname github.com: Temporary failure in name resolution". Добавляем в файл `/etc/resolv.conf` `nameserver 8.8.4.4` `nameserver 8.8.8.8` (https://codetryout.com/github-temporary-failure-in-name-resolution)
- Настраиваем данные о пользователе
  - `git config --global user.email "am.boltunob@gmail.com"`
  - `git config --global user.name "Artem Boltunov"`

### Создаём проект
- Переходим в склонированную дирректорию `cd ruby-blank-example`
- Выполняем команду `rails new . -d postgresql -j webpack --webpack=vue -c bootstrap -T`
  - `-d postgresql` конфигурация для БД, можно выбрать (mysql/trilogy/postgresql/sqlite3/oracle/sqlserver/jdbcmysql/jdbcsqlite3/jdbcpostgresql/jdbc)
  - `-j webpack` использовать Webpacker вместо стандартного системного ассет-пайплайна для управления фронтенд-ресурсами
  - `--webpack=vue` интеграция компонентов vue
  - `-c bootstrap` добавление стилей Bootstrap
  - `-T` пропускаем генерацию файлов для Unit тестов с использованием Test::Unit. (установим позже gem 'rspec-rails')
  - Для разбора других опций создания проекта можно выполнить `rails new --help`
