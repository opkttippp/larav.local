<template>
    <div class="content">
<!--                <div class="pulse scale-in-whatsapp-and-waves">-->
<!--                    <a target="_blank" href="https://wa.me/48690729272">-->
<!--                        <img alt="" height="30px" src="data:image/svg+xml;charset=utf-8,%0A%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2250%22%20height%3D%2250%22%20viewBox%3D%220%200%2050%2050%22%3E%0A%20%20%3Cg%3E%0A%20%20%20%20%3Ccircle%20cx%3D%2225%22%20cy%3D%2225%22%20r%3D%2225%22%20style%3D%22fill%3A%20%2330bf39%22%2F%3E%0A%20%20%20%20%3Cpath%20d%3D%22M39.8%2C23.4A14.64%2C14.64%2C0%2C0%2C1%2C25.1%2C38%2C15.25%2C15.25%2C0%2C0%2C1%2C18%2C36.2L9.8%2C38.8%2C12.5%2C31a14.84%2C14.84%2C0%2C0%2C1-2.1-7.5%2C14.7%2C14.7%2C0%2C0%2C1%2C29.4-.1ZM25.1%2C11.2A12.38%2C12.38%2C0%2C0%2C0%2C12.7%2C23.5a12%2C12%2C0%2C0%2C0%2C2.4%2C7.2l-1.5%2C4.6%2C4.8-1.5A12.44%2C12.44%2C0%2C0%2C0%2C37.6%2C23.5%2C12.53%2C12.53%2C0%2C0%2C0%2C25.1%2C11.2Zm7.4%2C15.6a3.22%2C3.22%2C0%2C0%2C0-.7-.4l-2.5-1.2c-.3-.1-.6-.2-.8.2a8.54%2C8.54%2C0%2C0%2C1-1.1%2C1.4.59.59%2C0%2C0%2C1-.8.1%2C11%2C11%2C0%2C0%2C1-2.9-1.8%2C9.88%2C9.88%2C0%2C0%2C1-2-2.5.46.46%2C0%2C0%2C1%2C.2-.7%2C2.65%2C2.65%2C0%2C0%2C0%2C.5-.6c.2-.2.2-.4.4-.6a.64.64%2C0%2C0%2C0%2C0-.6c-.1-.2-.8-1.9-1.1-2.7s-.6-.6-.8-.6h-.7a1.85%2C1.85%2C0%2C0%2C0-1%2C.4%2C4.16%2C4.16%2C0%2C0%2C0-1.3%2C3%2C6.45%2C6.45%2C0%2C0%2C0%2C1.5%2C3.7c.2.2%2C2.5%2C4%2C6.2%2C5.4s3.7%2C1%2C4.3.9a3.74%2C3.74%2C0%2C0%2C0%2C2.4-1.7A2.82%2C2.82%2C0%2C0%2C0%2C32.5%2C26.8Z%22%20style%3D%22fill%3A%20%23fff%22%2F%3E%0A%20%20%3C%2Fg%3E%0A%3C%2Fsvg%3E%0A">-->
<!--                        <span>&nbsp;</span>-->
<!--                        <span style="color: rgb(255, 255, 255);">Ask in Whatsapp!!-->
<!--                                </span>-->
<!--                        <span>&nbsp;&nbsp;</span>-->
<!--                    </a>-->
<!--                </div>-->

        <!--        <Carousel></Carousel>-->
        <div id="grid" class="mb-3">
            <div id="inner-grid" v-for="product in PRODUCTS.data" :key="product.id">
                <div style="overflow: hidden; height: 12em; align-self: center;">
                    <router-link :to="{name: 'Show', params: {id: product.id }}">
                        <img class="rounded mx-auto d-block"
                             :src="'http://larav.local/storage/' + product.image"
        alt="tv" style="width: 80%; height: 80%; object-fit: contain;">
                    </router-link>
                </div>
                <div id="inner-grid-div">
                    <div class="ml-3">
                        <router-link :to="{name: 'Show', params: {id: product.id }}">
                            {{ product.title }}
                        </router-link>
                    </div>
                    <div class="pl-2">
                        <p>
                            <router-link class="d-flex justify-content-start mt-4"
                                         :to="{name: 'Show', params: {id: product.id }}">
                                <span class="badge badge-success">{{ product.category.name }}</span>
                            </router-link>
                        </p>
                    </div>
                    <div class="pl-2">
                        <p class="d-flex justify-content-start fw-bold">₴ {{ product.price }}</p>
                    </div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <span>В наличии -</span>
                        <span>
                    <strong v-if="product.stock" class="text-success">{{ product.stock }}</strong>
                    <strong v-else class="text-danger">Sold out</strong>
                </span>
                        <span>
<!--                        <a href="{{ product.stock > 0 ? route('cart.add', ['productId' => $product->id]) : '#' }}"-->
                    <button :class="`btn w-100 shadow-none ${product.stock ? 'btn-success' : 'btn-secondary' }`"
                            :disabled="!product.stock"
                            @click="addProductToCart(product)">
                          to cart
                        <i class="fas fa-cart-arrow-down"></i>
                    </button>
<!--                            <div class="rz-banner__button">-->
<!--                  <a target="_blank" href="https://rozetka.com.ua/lenovo-zach0101ua/p393033699/" class="exponea-banner__wishlistpromo rz-button__link">-->

<!--                      <div class="rz-button__big rz-button__submit rz-button__green">Купити</div>-->
<!--                    <div class="rz-button__small">-->
<!--                      <img-->
<!--                           :src="'http://larav.local/storage/public/images/cart_2.png'">-->

<!--                    </div>-->
<!--                  </a>-->
<!--                </div>-->
                </span>
                    </div>
                </div>
            </div>
        </div>

        <div v-show="amountPage > 1"
             class="text-small text-uppercase text-extra-dark-gray pagination">
            <a v-show="page > 1" @click.prevent.stop="changePage(--page)"
               href="#">
                <i class="fas fa-long-arrow-alt-left"></i>
                <span class="xs-display-none border-none"></span>
            </a>
            <ul v-if="amountPage === 2" class="pagination-ul">
                <li class="pagination-li" @click.stop="changePage(item)" :class="[ page !== item ? '' : 'current']"
                    v-for="item in massPage(page)">{{ item }}
                </li>
            </ul>
            <ul v-else class="pagination-ul">
                <li v-if="page > 2 && amountPage > 3" class="pagination-li" @click.stop="changePage(1)"
                    :class="[ page !== item ? '' : 'current']">
                    1
                </li>
                <li v-if="page === 4 && amountPage > 4" class="pagination-li" @click.stop="changePage(2)"
                    :class="[ page !== item ? '' : 'current']">
                    2
                </li>
                <span v-if="page > 4" class="page-numbers dots">…</span>
                <li class="pagination-li" @click.stop="changePage(item)" :class="[ page !== item ? '' : 'current']"
                    v-for="item in massPage(page)">{{ item }}
                </li>
                <span v-if="page < amountPage - 3" class="page-numbers dots">…</span>

                <li v-if="page === amountPage - 3 && amountPage > 4" class="pagination-li"
                    @click.stop="changePage(amountPage)"
                    :class="[ page !== item ? '' : 'current']">
                    {{ amountPage - 1 }}
                </li>
                <li v-if="page < amountPage - 1 && amountPage > 3" class="pagination-li" @click.stop="changePage(amountPage)"
                    :class="[ page !== item ? '' : 'current']">
                    {{ amountPage }}
                </li>
            </ul>
            <a v-show="page !== amountPage" @click.prevent.stop="changePage(++page)"
               href="#">
                <span class="xs-display-none border-none"></span>
                <i class="fas fa-long-arrow-alt-right">
                </i>
            </a>
        </div>
    </div>
</template>

<script>

import {createNamespacedHelpers} from 'vuex'
const {mapActions, mapGetters} = createNamespacedHelpers('product');
import Carousel from "../components/Carousel";
import Paginate from "vuejs-paginate-next";


export default {
    name: "Product",
    components: {
        Carousel,
        paginate: Paginate,
    },
    props: {},
    data() {
        return {
            page: 1,
        }
    },
    computed: {
        ...mapGetters(['PRODUCTS']),
        amountPage() {
            // return Math.ceil(this.PRODUCTS.meta.total / this.PRODUCTS.meta.per_page)
            return this.PRODUCTS.meta.last_page;
        }
    },
    watch: {
        page() {
            this.GET_PRODUCTS(this.page)
        }
    },
    created() {
        this.GET_PRODUCTS(this.page);
    }
    ,
    methods: {
        changePage(page) {
            this.page = page;
        },
        ...mapActions([
            'GET_PRODUCTS',
        ]),
        addProductToCart(product) {
            this.$store.commit("product/addProductToCart", product);
        },
        massPage(page) {
            if (this.amountPage > 2) {
                let mas = [];
                if (page === 1) {
                    mas = [page, ++page, ++page];
                } else if (page === this.amountPage) {
                    mas = [page - 2, --page, ++page];
                } else {
                    mas = [--page, ++page, ++page];
                }
                return mas;
            } else {
                let mas = [];
                if (page === 1) {
                    mas = [page, ++page];
                } else {
                    mas = [--page, ++page];
                }
                return mas;
            }
        }
    },
}
</script>

<style scoped>
#grid {
    display: grid;
    grid-template-columns:repeat(auto-fill, minmax(20em, 1fr));
}

#grid > div {
    background: white;
    border-bottom: 1px solid #d2d2d2;
    border-right: 1px solid #d2d2d2;
}

#inner-grid {
    display: grid;
    grid-template-rows: 1fr 1fr;
    align-self: center;
}

#inner-grid-div {
    display: grid;
    grid-template-rows: 1fr 1fr 1fr 1fr;
    align-self: center;
}

.page__wraper {
    display: flex;
    margin-top: 15px;
    justify-content: center;
}

.page {
    border: 1px solid black;
    padding: 10px;
    background-color: white;
    margin: 6px;
}

.current-page {
    border: 2px solid teal;
}

.pulse {
    background-color: rgb(48, 191, 57);
    color: rgb(255, 255, 255);
    width: 238px;
    padding: 2px;
    position: absolute;
    display: inline-block;
    top: 160px;
    left: 100px;
    font-size: 1em;
    text-shadow: 0 1px 0 rgba(0, 0, 0, 0.53);
    text-align: center;
    line-height: 30px;
    border-radius: 50px;
}

.pulse:hover {
    cursor: pointer;
}

.scale-in-whatsapp-and-waves {
    animation: waves-whatsapp linear 3s infinite, scale-in .5s cubic-bezier(0.25, 0.46, 0.45, 0.94) both;
    animation-duration: 3s, 0.5s;
    animation-timing-function: linear, cubic-bezier(0.25, 0.46, 0.45, 0.94);
    animation-delay: 0s, 0s;
    animation-iteration-count: infinite, 1;
    animation-direction: normal, normal;
    animation-fill-mode: none, both;
    animation-play-state: running, running;
    animation-name: waves-whatsapp, scale-in;
    animation-timeline: auto;
    animation-range-start: normal;
    animation-range-end: normal;
}

@keyframes waves-whatsapp {
    0% {
        box-shadow: 0 8px 10px rgba(48, 191, 57, 0.3),
        0 0 0 0 rgba(48, 191, 57, 0.2),
        0 0 0 0 rgba(48, 191, 57, 0.2);
    }

    40% {
        box-shadow: 0 8px 10px rgba(48, 191, 57, 0.3),
        0 0 0 11px rgba(48, 191, 57, 0.2),
        0 0 0 0 rgba(48, 191, 57, 0.2);
    }

    80% {
        box-shadow: 0 8px 10px rgba(48, 191, 57, 0.3),
        0 0 0 22px rgba(48, 191, 57, 0),
        0 0 0 8px rgba(48, 191, 57, 0.067);
    }

    100% {
        box-shadow: 0 8px 10px rgba(48, 191, 57, 0.3),
        0 0 0 33px rgba(48, 191, 57, 0),
        0 0 0 16px rgba(48, 191, 57, 0.0);
    }
}

@keyframes scale-in {
    0% {
        transform: scale(0);
        opacity: 1;
    }

    100% {
        transform: scale(1);
        opacity: 1;
    }
}

.pagination {
    margin: 4em auto;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 0 15px;
}

.pagination-ul {
    display: flex;
    margin: 0;
    padding: 0;
    list-style-type: none;
}


.pagination-li, .pagination a, .pagination span.dots {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 3em;
    height: 3em;
    margin: 2px;
    padding: 0 18px;
    text-decoration: none;
    cursor: pointer;
    border: 0px solid transparent;
    border-radius: 100%;
    background: #fff;
}

.pagination a.prev:hover, .pagination a.next:hover, .pagination-li:hover {
    color: #f16a21;
}

.pagination li.current {
    margin: 2px;
    padding: 0 18px;
    background-color: #f16a21;
    color: #ffffff;
    cursor: default;
    line-height: 3rem;
    text-decoration: none;
}


.text-small {
    font-size: 12px;
    line-height: 20px;
}

span.dots {
    padding: 0 18px;
    line-height: 40px;
    text-decoration: none;
    border: 1px solid #ddd;
    border-left-width: 0;
    background: #fff;
}

/*--------------------------------*/
</style>



