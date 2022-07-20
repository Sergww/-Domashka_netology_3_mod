import json
from psycopg2 import connect
from sqlalchemy import create_engine
import sqlalchemy as sq
from sqlalchemy.orm import declarative_base, relationship, sessionmaker

HELP1 = """
Выберите откуда будем брать данные:
    0 - из этого кода
    1 - из json-файла
"""

HELP2 = """
Если будете водить идентификатор издателя (id), введите "0"
если будете вводить название издателя, введите "1"
для выход из этого меню введите "q"
"""

Base = declarative_base()

class Shop(Base):
    __tablename__ = "shop"
    id = sq.Column(sq.Integer, primary_key=True)
    name = sq.Column(sq.String(length=40), unique=True)

class Publisher(Base):
    __tablename__ = "publisher"
    id = sq.Column(sq.Integer, primary_key=True)
    name = sq.Column(sq.String(length=40), unique=True)

class Book(Base):
    __tablename__ = "book"

    id = sq.Column(sq.Integer, primary_key=True)
    title = sq.Column(sq.Text, nullable=False)
    id_publisher = sq.Column(sq.Integer, sq.ForeignKey("publisher.id"), nullable=False)

    publisher = relationship(Publisher, backref="book")

class Stock(Base):
    __tablename__ = "stock"
    # __table_args__ = (
    #     PrimaryKeyConstraint('id_book', 'id_shop'),
    # )

    id = sq.Column(sq.Integer, primary_key=True)
    id_book = sq.Column(sq.Integer, sq.ForeignKey("book.id"), nullable=False)
    id_shop = sq.Column(sq.Integer, sq.ForeignKey("shop.id"), nullable=False)
    count = sq.Column(sq.Integer, nullable=False)

    book = relationship(Book, backref="stock")
    shop = relationship(Shop, backref="stock")



class Sale(Base):
    __tablename__ = "sale"

    id = sq.Column(sq.Integer, primary_key=True)
    price = sq.Column(sq.DECIMAL, nullable=False)
    date_sale = sq.Column(sq.DateTime, nullable=False)
    id_stock = sq.Column(sq.Integer, sq.ForeignKey("stock.id"), nullable=False)
    count = sq.Column(sq.Integer, nullable=False)

    stock = relationship(Stock, backref="sale")


def create_tables(engine):
    Base.metadata.drop_all(engine)
    Base.metadata.create_all(engine)

def print_result(qq):
    print(f'\nВыводим результат:')
    p = '0'
    if qq.all() != []:
        for s in qq.all():
            print(s.id, s.name)
            return s.name
    else:
        print('По заданным параметрам ничего не найдено!')
    return p


if __name__ == '__main__':

    # DSN = "postgresql://postgres:1@localhost:5432/domaska-3-6"
    # conn = connect(
    dbname = 'domaska-3-6'
    user = 'postgres'
    host = 'localhost'
    password = '1'
    port = '5432'

    DSN = f'postgresql://{user}:{password}@{host}:{port}/{dbname}'
    # dsm_param = conn.get_dsn_parameters()
    # print(conn.dsn)
    # print(dsm_param)
    engine = sq.create_engine(DSN)
    create_tables(engine)

    Session = sessionmaker(bind=engine)
    session = Session()

    while True:
        print(HELP1)
        choice = input('Ваш выбор -> ')
        if choice == '0':
            # Заполняем таблицу
            shop_1 = Shop(name='Порядок слов')
            shop_2 = Shop(name='Читай-город')
            shop_3 = Shop(name='Книжный Лабиринт')
            shop_4 = Shop(name='Буквоед')
            session.add_all([shop_1, shop_2, shop_3, shop_4])

            publisher_1 = Publisher(name='Гангут')
            publisher_2 = Publisher(name='АСТ')
            publisher_3 = Publisher(name='Азбука')
            publisher_4 = Publisher(name='Русич')
            session.add_all([publisher_1, publisher_2, publisher_3, publisher_4])

            book_1 = Book(title='Таран В.В. В Питере СТАРТАПить', id_publisher=1)
            book_2 = Book(title='Веселин Г.В. Сейф живучести', id_publisher=1)
            book_3 = Book(title='Жебрак М. Пешком по Москве', id_publisher=2)
            book_4 = Book(title='Хьюэн Сэм. Шотландия: земля кланов', id_publisher=2)
            book_5 = Book(title='Бен Ротери. Океан и его обитатели', id_publisher=3)
            book_6 = Book(title='Иванов Ю.Г. Город--герой Смоленск. 500 вопросов и ответов', id_publisher=4)
            session.add_all([book_1, book_2, book_3, book_4, book_5, book_6])

            stock_1 = Stock(id_shop=4, id_book=1, count=55)
            stock_2 = Stock(id_shop=4, id_book=2, count=63)
            stock_3 = Stock(id_shop=2, id_book=2, count=7)
            stock_4 = Stock(id_shop=3, id_book=1, count=8)
            stock_5 = Stock(id_shop=1, id_book=5, count=9)
            stock_6 = Stock(id_shop=2, id_book=3, count=11)
            stock_7 = Stock(id_shop=1, id_book=4, count=12)
            stock_8 = Stock(id_shop=2, id_book=5, count=3)
            stock_9 = Stock(id_shop=3, id_book=6, count=1)
            session.add_all([stock_1, stock_2, stock_3, stock_4, stock_5, stock_6, stock_7, stock_8, stock_9])

            sale_1 = Sale(price=699.99, date_sale="2022-07-18T09:01:34Z", id_stock=1, count=10)
            sale_2 = Sale(price=999.99, date_sale="2022-07-18T09:02:36.156Z", id_stock=2, count=2)
            sale_3 = Sale(price=730.00, date_sale="2022-07-18T09:02:45.376", id_stock=3, count=13)
            sale_4 = Sale(price=799.99, date_sale="2022-07-18T09:03:53.123", id_stock=4, count=4)
            sale_5 = Sale(price=750.00, date_sale="2022-07-18T09:04:47.246", id_stock=5, count=7)
            sale_6 = Sale(price=799.99, date_sale="2022-07-18T09:05:16.102", id_stock=6, count=11)
            sale_7 = Sale(price=599.99, date_sale="2022-07-18T09:06:34.126", id_stock=7, count=7)
            sale_8 = Sale(price=979.00, date_sale="2022-07-18T09:07:31.468", id_stock=8, count=9)
            sale_9 = Sale(price=1520.00, date_sale="2022-07-18T09:08:39.157", id_stock=9, count=8)
            session.add_all([sale_1, sale_2, sale_3, sale_4, sale_5, sale_6, sale_7, sale_8, sale_9])

            # фиксируем изменения
            session.commit()
            print(f'Таблицы созданы и заполнены\n')
            break

        elif choice == '1':

            with open('tests_data.json', encoding='utf-8') as f:
                datas = json.load(f)

            for data in datas:
                if data['model'] == 'publisher':
                    publisher_i = Publisher(id=data['pk'], name=data['fields']['name'])
                    session.add(publisher_i)
                if data['model'] == 'book':
                    book_i = Book(id=data['pk'], title=data['fields']['title'], id_publisher=data['fields']['id_publisher'])
                    session.add(book_i)
                if data['model'] == 'shop':
                    shop_i = Shop(id=data['pk'], name=data['fields']['name'])
                    session.add(shop_i)
                if data['model'] == 'stock':
                    stock_i = Stock(id=data['pk'], id_book=data['fields']['id_book'], id_shop=data['fields']['id_shop'], count=data['fields']['count'])
                    session.add(stock_i)
                if data['model'] == 'sale':
                    sale_i = Sale(id=data['pk'], price=data['fields']['price'], date_sale=data['fields']['date_sale'], count=data['fields']['count'], id_stock=data['fields']['id_stock'])
                    session.add(sale_i)
            session.commit()
            print(f'Таблицы созданы и заполнены\n')
            break

        else:
            print('Некорректный ввод, повторите!')

    pub_n = '0'
    while True:
        print(HELP2)
        choice = input('Ваш выбор -> ')
        if choice == '0':
            q = session.query(Publisher).filter(Publisher.id == input('Введите id издателя -> '))
            pub_n = print_result(q)
        elif choice == '1':
            q = session.query(Publisher).filter(Publisher.name == input('Введите название издателя -> '))
            pub_n = print_result(q)
        elif choice.lower() == 'q':
            break
        else:
            print('Ошибка! Повторите ввод!')

    if pub_n != '0':
        print(f'\nСписок магазинов, в которых можно купить книги издателя "{pub_n}":')
        q = session.query(Publisher.name, Shop.name).join(Book).join(Stock).join(Shop).filter(Publisher.name == pub_n).distinct().all()
        for res in q:
            print(f'"{res[1]}"')

    session.close()