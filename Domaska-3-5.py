import psycopg2
from pprint import pprint

help = """
c  – создание таблиц;
r  – пересоздание таблиц;
d  – удаление таблиц;
ad - добавление клиентов из списка;
a  - добавление клиента вручную;
ap - добавление телефона в карточку клиента;
cd - изменение данных в карточке клиента;
dp - удаление телефона в карточке клиента;
dk - удаление клиента;
s  - поиск клиента в БД;
l  - вывод всех таблиц;
q  - ВЫХОД;
h  - справка по командам;
"""

help2 = """
1 – изменить имя;
2 – изменить фамилию;
3 – изменить e-mail;
4 - выход;
"""

help3 = """
1 – поиск по имени;
2 – поиск по фамилии;
3 – поиск по e-mail;
4 - поиск по телефону;
5 - выход;
"""

clients = [('Сергей', 'Теплов', 'serg@ya.ru'), ('Андрей', 'Свердлов', 'mona@mail.ru'), ('Борис', 'Скляр', 'skl@ik.ru'),
           ('Андрей', 'Шпорт', 'port@ng.ty')]
phones = [('+79110034567',), ('+79213456789',), ('+78123456723',), ('+79815672345',), ('+781324567862',), ('+7812345',)]
clientphones = [(1, 1), (2, 2), (2, 3), (3, 4), (3, 5), (4, 6)]


def delete_table(cur, connect): # удаление всех таблиц
    print('ВНИМАНИЕ!!! Все таблицы с данными будут удалены!!!')
    choice = input('Если подтверждаете удаление, введите "y": ')
    if choice == 'y':
        cur.execute("""
            DROP TABLE clientphone;
            DROP TABLE clients;
            DROP TABLE phones;
            """)
        connect.commit()
        return f'Таблицы удалены'
    return f'Выход без удаления'

def create_table(cur, connect): # создание всех таблиц

    cur.execute("""
        CREATE TABLE IF NOT EXISTS clients(
            id SERIAL PRIMARY KEY,
            first_name VARCHAR(40) NOT NULL,
            last_name VARCHAR(40) NOT NULL,
            e_mail VARCHAR(40) NOT NULL
        );
        """)

    cur.execute("""
        CREATE TABLE IF NOT EXISTS phones(
            id SERIAL PRIMARY KEY,
            phone VARCHAR(30)
        );
        """)

    cur.execute("""
        CREATE TABLE IF NOT EXISTS clientphone(
            client_id INTEGER NOT NULL REFERENCES clients(id),
            phone_id INTEGER REFERENCES phones(id),
            constraint pk primary key (client_id, phone_id)
        );
        """)

    connect.commit()
    return f'Таблицы созданы'

def adding_client_dicts(cur, connect, clients, phones, clientphones): # добавление клиентов из словаря
    for client in clients:
        cur.execute("""
            INSERT INTO clients(first_name, last_name, e_mail) VALUES(%s, %s, %s);
            """, (client[0], client[1], client[2]))
    for phone in phones:
        cur.execute("""
            INSERT INTO phones(phone) VALUES(%s);        
            """, (phone[0],))
    for clientphone in clientphones:
        cur.execute("""
            INSERT INTO clientphone(client_id, phone_id) VALUES(%s, %s);
            """, (clientphone[0], clientphone[1]))
    connect.commit()
    return f'Клиенты добавлены'

def adding_client(cur, connect): # добавление клиентов вручную
    print('Добавляем клиента:\n')
    first_name = input('Введите имя: ').strip()
    last_name = input('Введите фамилию: ').strip()
    e_mail = input('Введите e_mail: ').strip()
    phone = input('Введите телефон: ').strip()

    cur.execute("""
        INSERT INTO clients(first_name, last_name, e_mail) VALUES(%s, %s, %s);
        """, (first_name, last_name, e_mail))

    cur.execute("""
        INSERT INTO phones(phone) VALUES(%s);        
        """, (phone,))
    connect.commit()
    cur.execute("""
        SELECT id FROM clients
        WHERE first_name = %s AND last_name = %s AND e_mail = %s;
        """, (first_name, last_name, e_mail))
    id_client = cur.fetchone()[0]

    cur.execute("""
        SELECT id FROM phones
        WHERE phone = %s;
        """, (phone,))
    id_phone = cur.fetchone()[0]

    cur.execute("""
        INSERT INTO clientphone(client_id, phone_id) VALUES(%s, %s);
        """, (id_client, id_phone))

    connect.commit()

    return f'Клиент добавлен'

def adding_phone(cur, connect):  # добавление телефона клиенту
    print('\nДобавляем телефон:')
    client_id = input_validation()
    phone = input('Введите номер телефона: ').strip()

    cur.execute("""
        SELECT id FROM phones
        WHERE phone = %s;
        """, (phone,))

    cur.execute("""
        INSERT INTO phones(phone) VALUES(%s);
        """, (phone,))
    connect.commit()

    cur.execute("""
            SELECT id FROM phones
            WHERE phone = %s;
            """, (phone,))
    id_phone = cur.fetchone()[0]

    cur.execute("""
            INSERT INTO clientphone(client_id, phone_id) VALUES(%s, %s);
            """, (client_id, id_phone))
    connect.commit()

    return f'Телефон добавлен'

def change_client(cur, connect): # изменение данных клиента
    client_id = input_validation()

    while True:
        print(help2)
        choice = input("Ваш выбор: ")
        if choice == '1':
            new_f_name = input('Введите новое имя: ')
            cur.execute("""
                UPDATE clients SET first_name=%s
                WHERE id=%s;
                """, (new_f_name, client_id))

        elif choice == '2':
            new_l_name = input('Введите новую фамилию: ')
            cur.execute("""
                UPDATE clients SET last_name=%s
                WHERE id=%s;
                    """, (new_l_name, client_id))

        elif choice == '3':
            new_e_mail = input('Введите новый e_mail: ')
            cur.execute("""
                UPDATE clients SET e_mail=%s
                WHERE id=%s;
                    """, (new_e_mail, client_id))

        elif choice == '4':
            break
        else:
            print('Неправильная команда.')

    connect.commit()
    return f'Данные изменены'

def delete_client(cur, connect): # удаление клиента
    client_id = input_validation()
    cur.execute("""
        SELECT phone_id FROM clientphone
        WHERE client_id = %s;
        """, (client_id,))
    id_phone_del = cur.fetchall()

    cur.execute("""
        DELETE FROM clientphone
        WHERE client_id=%s;
        """, (client_id,))

    for phone_del in id_phone_del:
        cur.execute("""
            DELETE FROM phones
            WHERE id=%s;
            """, (phone_del[0],))

    cur.execute("""
        DELETE FROM clients
        WHERE id=%s;
        """, (client_id,))

    connect.commit()
    return f'Клиент id = {client_id} удален'

def delete_phone(cur, connect): # удаление телефона
    client_id = input_validation()
    cur.execute("""
            SELECT phone_id FROM clientphone
            WHERE client_id = %s;
            """, (client_id,))
    id_phone_del = cur.fetchall()
    if len(id_phone_del) == 0:
        return f'У клиента нет телефонов в базе'
    if len(id_phone_del) > 1:
        print('У клиента более одного телефона в базе!')
        choice = input('Удаляем все? "y"')
        if choice != 'y':
            print('Выберите id удаляемых номеров:')
            for id_ in id_phone_del.copy():
                print('id = ', id_[0])
                choice = input('Удаляем "y"?')
                if choice != 'y':
                    id_phone_del.remove(id_)

    for phone_del in id_phone_del:
        cur.execute("""
            DELETE FROM clientphone
            WHERE phone_id=%s;
            """, (phone_del[0],))

        cur.execute("""
            DELETE FROM phones
            WHERE id=%s;
            """, (phone_del[0],))

    connect.commit()
    return f'Удалили телефоны'

def search_client(cur): # поиск клиента
    while True:
        print(help3)
        choice = input("Ваш выбор: ")
        if choice == '1':
            first_name = input('Введите имя клиента: ')
            cur.execute("""
                SELECT c.id, c.first_name, c.last_name, c.e_mail, p.phone FROM clients c
                JOIN clientphone cl ON c.id = cl.client_id
                JOIN phones p  ON p.id = cl.phone_id
                WHERE c.first_name = %s;
                """, (first_name, ))
            result = cur.fetchall()

        elif choice == '2':
            last_name = input('Введите фамилию: ')
            cur.execute("""
                SELECT c.id, c.first_name, c.last_name, c.e_mail, p.phone FROM clients c
                JOIN clientphone cl ON c.id = cl.client_id
                JOIN phones p  ON p.id = cl.phone_id
                WHERE c.last_name = %s;
                """, (last_name, ))
            result = cur.fetchall()

        elif choice == '3':
            e_mail = input('Введите e_mail: ')
            cur.execute("""
                SELECT c.id, c.first_name, c.last_name, c.e_mail, p.phone FROM clients c
                JOIN clientphone cl ON c.id = cl.client_id
                JOIN phones p  ON p.id = cl.phone_id
                WHERE c.e_mail = %s;
                """, (e_mail, ))
            result = cur.fetchall()

        elif choice == '4':
            phone = input('Введите телефон: ')
            cur.execute("""
                SELECT c.id, c.first_name, c.last_name, c.e_mail, p.phone FROM clients c
                JOIN clientphone cl ON c.id = cl.client_id
                JOIN phones p  ON p.id = cl.phone_id
                WHERE p.phone = %s;
                """, (phone, ))
            result = cur.fetchall()

        elif choice == '5':
            break
        else:
            print('Неправильная команда!')

        if len(result) == 0:
            result = 'Совпадений не найдено'
        print(f'\n     Результаты поиска:')
        pprint(result)
    return f'Окончен поиск\n'

def list_tables(cur): # Общая таблица
    cur.execute("""
        SELECT c.id, c.first_name, c.last_name, c.e_mail, p.phone  FROM clients c
        LEFT JOIN clientphone cl ON c.id = cl.client_id
        LEFT JOIN phones p ON p.id = cl.phone_id
        ORDER BY c.id;
        """)
    return cur.fetchall()

def input_validation(): # проверка введенного id клиента на валидность
    condition = True
    while condition:
        try:
            client_id = int(input('Введите id клиента: '))
            cur.execute("""
                    SELECT id FROM clients;
                    """)
            all_id = cur.fetchall()
            for id_ in all_id:
                message = 'Нет такого id'
                if client_id == id_[0]:
                    condition = False
                    message = 'Есть такой клиент'
                    break
            print(message)
        except ValueError:
            print('Неправильный ввод')
    return client_id



conn = psycopg2.connect(database='domaska-3-5', user='postgres', password='1')
with conn.cursor() as cur:
    while True:
        command = input('\nВведите команду (h - справка по командам): ').strip().lower()
        if command == 'c':
            print(create_table(cur, conn))
        elif command == 'd':
            print(delete_table(cur, conn))
        elif command == 'r':
            print(delete_table(cur, conn))
            print(create_table(cur, conn))
        elif command == 'ad':
            print(adding_client_dicts(cur, conn, clients, phones, clientphones))
        elif command == 'ap':
            print(adding_phone(cur, conn))
        elif command == 'cd':
            print(change_client(cur, conn))
        elif command == 'a':
            print(adding_client(cur, conn))
        elif command == 'dk':
            print(delete_client(cur, conn))
        elif command == 'dp':
            print(delete_phone(cur, conn))
        elif command == 's':
            print(search_client(cur))
        elif command == 'l':
            pprint(list_tables(cur))
        elif command == 'h':
            print(help)
        elif command == 'q':
            break
        else:
            print('Неизвестная команда!')

    print('конец работы')

    conn.close()
