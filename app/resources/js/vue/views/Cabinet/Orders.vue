<template>
    <div class="content">

        <h1 class="cabinet__heading">Мои заказы</h1>
        <div class="block" v-for="order in orders">
            <div class="header">
                <div class="order-heading__status">
                    <p class="status__header">
                        <span> № {{ order.id }} </span>
                        <span class="data"> от {{ setDate(order.updated_at) }} </span>
                    </p>
                    <p class="status__header">
                        <span class="fulfilled--title resolved"
                              :style="[order.fulfilled ? 'color:green;' : 'color: grey;']"
                        >{{ order.fulfilled ? ' Выполен ' : ' Не выполен ' }}</span>
                    </p>
                </div>

                <div class="order-heading__content">
                    <div class="image-list">
                        <div v-for="item in imagePreview(order.item)">
                            <img :src="`http://larav.local/storage/${item.image}`" alt="leaf" class="image">
                        </div>
                    </div>
                </div>
                <div class="order-heading__price">
                    <div class="price">
                        <p class="status__header payed"
                           :style="[order.payed ? 'color:green;' : 'color: grey;']"
                        >
                            <span>{{ order.payed ? 'Оплачен' : 'Не оплачен' }}</span>
                        </p>
                        <p class="status__header">
                            <span> {{ getSums(order.total) }} ₴</span>
                        </p>
                    </div>
                </div>
                <div class="d-flex align-items-center justify-content-center cursor">
                    <img class="cursorDown" :src="'/images/cursorDown.png'" width="25" height="25" alt="cursorDown">
                </div>
            </div>

            <div class="orders-section__body">
                <div class="orders-section_status">
                    <span class="resolved"
                          :style="[order.fulfilled ? 'color:green;' : 'color: grey;']"
                    >{{ order.fulfilled ? ' Выполен ' : ' Не выполен ' }}</span>

                    <span class="data"
                          v-if="order.fulfilled"
                    > {{ setDate(order.updated_at) }} </span>
                    <div class="button-list-block">
                        <button type="button" class="btn btn-success button-list"> Повторить заказ</button>
                        <button type="button" class="btn btn-primary button-list"> Оставить отзыв</button>
                    </div>

                    <div style="width:100%;
                margin-top: 1em;
                font-size: 1rem;
                border-bottom: 1px solid #e9e9e9;
        ">
                        <ul class="left-order-menu"
                            style="list-style: none;

                        padding: 0;"
                        >
                            <li class="left-order-menu__summary-item ng-star-inserted">
                                <div class="left-order-menu__summary-route ng-star-inserted"
                                style="display:flex;
                                align-items: center;">
                                    <img style="margin:0;padding:0;" :src="'/images/nova-poshta.jpg'" width="25" height="25" alt="cursorDown">
                                    <div class="left-order-menu__delivery-email">
                                        <span>Самовывоз из Новой Почты</span>
                                    </div>
                                </div>
                                <p class="left-order-menu__summary-item ng-star-inserted"> TTH: 20450799660184 </p>
                            </li>
                            <li class="left-order-menu__summary-item left-order-menu__address ng-star-inserted">
                                    <span class="left-order-menu__label">Адрес доставки</span>
                                    <span
                                        class="button button--small button--link left-order-menu__address-summary ng-star-inserted">
                                        Харьковская обл., Харьковский р-н., Охочее, 1, ул. Заозерная, д.7
                                    </span>
                                <a
                                    class="button button--small button--icon button--link ng-star-inserted"
                                    title="Проложить маршрут" aria-label="Проложить маршрут">
                                    <svg width="24" height="24" aria-hidden="true">
                                        <use href="#icon-route"></use>
                                    </svg>
                                </a>
                            </li>
                            <li class="left-order-menu__summary-item ng-star-inserted">
                                <span class="left-order-menu__label">График работы</span>
                                <div class="ng-star-inserted">
                                    <span>Пн</span>
                                    <span class="ng-star-inserted">-Сб</span>: <span class="ng-star-inserted">08:00-16:00</span>
                                </div>
                                <div class="ng-star-inserted">
                                    <span>Вс</span>: <span class="ng-star-inserted">выходной</span>
                                </div>
                            </li>
                            <li class="left-order-menu__summary-item ng-star-inserted">
                                <span class="left-order-menu__label">Получатель заказа</span>
                                <p class="visible-hidden">
                                    {{order.customerLastName }} {{order.customerName}}
                                </p>
                                <p class="visible-hidden"> {{order.customerPhone}} </p>
                                <p class="visible-hidden"> {{order.customerEmail}} </p>
                            </li>
                        </ul>
                    </div>
                </div>

                <ul class="orders-section_block">
                    <li class="order-data__item" v-for="item in order.item">
                        <div class="div-image">
                            <img :src="`http://larav.local/storage/${item.image}`" alt="leaf" class="image">
                        </div>
                        <div class="div-block">
                            <div style="display: flex; flex-direction: row; width: 100%;">
                                <div class="order-list_title">
                                    {{ item.title }}
                                </div>
                                <div class="order-list_twix">
                                    <div> {{ item.price }} ₴ x {{ item.quantity }} ед.</div>
                                    <div class="order-list_total"> {{ getSum(item.quantity * Number(item.price)) }} ₴
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <ul class="order-payment">
                            <li class="order-payment__row">
                                <span class="order-payment__label"> Оплата </span>
                                <span class="inserted"> PrivatPay </span>
                            </li>
                            <li class="order-payment__row">
                                <span class="order-payment__label"> Статус оплаты </span>
                                <span class="inserted payed"
                                      :style="[order.payed ? 'color:green;' : 'color: grey;']"
                                >
                            {{ order.payed ? 'Оплачен' : 'Не оплачен' }}</span>
                            </li>
                            <li class="order-payment__row">
                                <span class="order-payment__label"> Доставка </span>
                                <p class="inserted">По тарифам перевозчика
                                    <span class="currency">₴</span>
                                </p>
                            </li>
                            <li class="order-payment__row">
                                <span class="order-payment__label"> Итого </span>
                                <span class="inserted bold">620
                            <span class="fs-14 currency">₴</span>
                        </span>
                            </li>
                        </ul>
                    </li>
                </ul>
                <!--                                    <div class="personal-data__footer">-->
                <!--                                        <button class="btn btn-success personal-data__edit"-->
                <!--                                                @click.prevent.stop="editMain = !editMain"-->
                <!--                                        > Редактировать-->
                <!--                                        </button>-->
                <!--                                    </div>-->
            </div>

        </div>
    </div>
</template>

<script>
export default {
    name: "Orders",
    data: () => {
        return {
            orders: Array
        }
    },
    mounted() {
        this.AnimationList();
    },
    methods: {
        async AnimationList() {
            await this.getOrders();
            let header = document.querySelectorAll('.header');
            // console.log(header);
            header.forEach((item) => {
                let isShow = false;
                item.addEventListener('click', function () {
                    let block = item.closest('.block');
                    let cursor = item.querySelector('.cursorDown');
                    let content = item.querySelector('.order-heading__content');
                    let price = item.querySelector('.order-heading__price');
                    let fulfilled = item.querySelector('.fulfilled--title');
                    if (isShow === false) {
                        isShow = true;
                        block.style.height = 'auto';
                        block.style.transition = 'all 0.6s';
                        cursor.style.transform = ' rotate(180deg)';
                        cursor.style.transition = 'all .6s';
                        content.style.display = 'none';
                        price.style.display = 'none';
                        fulfilled.style.display = 'none';
                    } else {
                        isShow = false;
                        block.style.height = '5em';
                        block.style.transition = 'all .6s';
                        cursor.style.transform = '';
                        cursor.style.transition = 'all .6s';
                        content.style.display = 'flex';
                        price.style.display = 'flex';
                        fulfilled.style.display = 'block';
                    }
                })
            })
        },
        async getOrders() {
            try {
                this.id = await this.$store.state.auth.user.id;
                const res = await axios.get(`http://larav.local/api/order/${this.id}`);
                this.orders = await res.data;
                console.log(await res.data);
            } catch (data) {
                this.error = await data.error;
            }
        },
        setDate(data) {
            const current = new Date(data);
            return `${current.getDate()} ${this.getNameMonth(current)} ${current.getFullYear()}`;
        },
        getNameMonth(data) {
            const mounth = data.getMonth();
            switch (mounth) {
                case 0: {
                    return 'Января';
                }
                case 1: {
                    return 'Февраля';
                }
                case 2: {
                    return 'Марта';
                }
                case 3: {
                    return 'Апреля';
                }
                case 4: {
                    return 'Мая';
                }
                case 5: {
                    return 'Июня';
                }
                case 6: {
                    return 'Июля';
                }
                case 7: {
                    return 'Августа';
                }
                case 8: {
                    return 'Сентября';
                }
                case 9: {
                    return 'Октября';
                }
                case 10: {
                    return 'Ноября';
                }
                case 11: {
                    return 'Декабря';
                }
            }

            return `${current.getDate()}.${current.getMonth() + 1}.${current.getFullYear()}`;
        },
        getSums(data) {
            return data.replace(/(\d)(?=(\d{3})+(\D|$))/g, '$1 ');
        },
        getSum(data) {
            return String(data).replace(/(\d)(?=(\d{3})+(\D|$))/g, '$1 ');
        },
        imagePreview(image) {
            return image.slice(0, 4);
        }
    }
}
</script>

<style scoped>

.content {
    display: flex;
    flex-direction: column;
    overflow: auto;
    box-sizing: border-box;
    margin: 1em;
}

.cabinet__heading {
    font-size: 2em;
    padding: 0 1em;
}

.block {
    margin: .3em;
    padding: 0;
    height: 5em;
    /*border: 1px solid rgb(121, 120, 120);*/
    border: 1px solid #e9e9e9;
    border-radius: .5em;
    overflow: hidden;
}

.header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin: 0;
    padding: 1em;
    cursor: pointer;
    outline: none;
    vertical-align: baseline;
}

.order-heading__status {
    display: flex;
    flex-direction: column;
    width: 30%;
    padding: 0;
    margin: 0;
    font-family: Arial, Segoe UI, Roboto, Helvetica, sans-serif;
    font-size: 18px;
    font-weight: 600;
    /*line-height: 1;*/
}

.order-heading__content {
    display: flex;
    justify-content: space-between;
    width: 42%;
    padding: 0;
    margin: 0;
}

.orders-section_block {
    list-style: none;
    padding: 1em;
    width: 100%;
}

.order-data__item {
    display: flex;
    align-items: center;
    padding: 1em;
    gap: 1em;
    width: 100%;
    border-bottom: 1px solid #e9e9e9;
}

.div-block {
    display: flex;
    flex-direction: column;
    width: 100%;
}

.order-list_title {
    display: flex;
    justify-content: flex-start;
    align-items: center;
    margin: 0 1em 0 0;
    padding: 0;
    width: 50%;

}

.order-list_twix {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    width: 50%;
    font-size: 14px;
}

.order-list_total {
    font-weight: 600;
}

.order-payment {
    list-style: none;
    border-bottom: 1px solid #e9e9e9;
}

.order-payment__row {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    height: 2.6em;
    font-size: 1em;
}

.order-payment__label {
    color: #797878;
}

.order-heading__price {
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 9em;
    margin: 0;
    padding-right: 1em;
    font-family: Arial, Segoe UI, Roboto, Helvetica, sans-serif;
    font-weight: 600;
    background-color: white;
}

.price {
    position: relative;
}

.price:before {
    position: absolute;
    right: 7em;
    width: 12em;
    height: 3em;
    background: linear-gradient(to right, rgba(255, 255, 255, 0) 0%, rgb(255, 255, 255) 100%);
    content: "";
}

.data {
    font-size: .8em;
    font-weight: 300;
    padding-left: 1em;
}

.status__header {
    margin: 0;
    padding: 0;
    font-size: 1.2rem;
}

.resolved {
    font-size: .8em;
    font-weight: 600;
    color: green;
}

.payed {
    font-size: 1em;
    font-weight: 600;
    color: #797878;
}


svg {
    flex-shrink: 0;
    width: 24px;
    height: 24px;
    align-items: center;
    margin-right: 1em;

}

cursor {
    flex-shrink: 0;
    width: 1em;
    height: 1em;
}

.cursorDown {
    margin: 0 1em;
    color: #3e77aa;
}

.orders-section__body {
    display: flex;
    vertical-align: baseline;

}

.personal-data__label {
    font-size: 12px;
    font-weight: normal;
    color: rgb(121, 120, 120);
}

.image-list {
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: center;
}

.image {
    padding: 0 1em;
    height: 2.5em;
    object-fit: cover;
}

.div-image {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 7em;
}

.button-list {
    width: 100%;
    margin: 1em 0;
}

.button-list-block {
    border-bottom: 1px solid #e9e9e9;
}

.inserted {
    height: 1em;
}

.orders-section_status {
    width: 31%;
    min-width: 15rem;
    height: 100%;
    margin: 1em;
    border-top: 1px solid #e9e9e9;
    font-size: 1.2em;
}

.left-order-menu__label {
    display: block;
    font-size: 1em;
    color: #797878;
    margin: 1em 0;
}

.bold {
    font-weight: 600;
    /*font-size: 1.2em;*/
}

.visible-hidden {
    margin: 0;
    padding: 0;
    border: 0;
}

</style>
