<template>

    <div class="d-flex flex-column parent"
         style="position: relative;">

        <div v-show="overload"
             class="overload"
             @click="AccountHideList"
        >
            <div class="account-list">
                <div class="list">
                    <div class="side-menu__header">
                        <a class="side-menu__logo" href="/">
                            MySait
                        </a>
                        <button type="button" class="btn-close btn-close-white">
                        </button>
                    </div>
                    <div v-if="this.user" class="side-menu__name">
                        <router-link to="/account" class="side-menu__auth-wrap">

                            <img v-if="this.user.avatar"
                                 :src="`http://larav.local/storage/${this.user.avatar}`"
                                 alt="avatar"
                                 class="side-menu__avatar"
                            >

                            <div class="side-menu__avatar"
                                 v-else>
                                {{ this.avatar.substr(0, 1) }}
                            </div>
                            <div class="side-menu__auth-content">
                                <span class="side-menu__user-name">
                                    {{ this.user.lastname }}
                                    {{ this.user.name }}
                                </span>
                                <p class="side-menu__auth-caption">
                                    {{ this.user.email }}
                                </p>
                            </div>
                        </router-link>
                    </div>

                    <ul class="side-menu__list">
                        <li class="side-menu__item">
                                <span class="icon">
                                    <font-awesome-icon :icon="['fas', 'layer-group']"/>
                                </span>
                            <a
                                @click="catalogModal=!catalogModal"
                            >
                                Каталог товаров
                            </a>
                        </li>
                        <li class="side-menu__item">
                                <span class="icon">
                                    <font-awesome-icon :icon="['fas', 'circle-question']"/>
                                </span>
                            <a>
                                Справочный центр
                            </a>
                        </li>
                        <li class="side-menu__item">
                                <span class="icon">
                                    <font-awesome-icon :icon="['fas', 'list']"/>
                                </span>
                            <router-link :to="{ name: 'Orders'}">
                                Мои заказы
                            </router-link>
                        </li>
                        <li class="side-menu__item">
                                <span class="icon">
                                    <font-awesome-icon :icon="['fas', 'cart-shopping']"/>
                                </span>
                            <a
                                data-bs-target="#cartModal"
                                data-bs-toggle="modal"
                            >
                                Корзина
                            </a>
                        </li>
                        <li class="side-menu__item">
                                <span class="icon">
                                    <font-awesome-icon :icon="['fas', 'bell']"/>
                                </span>
                            <a>
                                Персональные предложения
                            </a>
                        </li>
                        <li class="side-menu__item">
                                <span class="icon">
                                    <font-awesome-icon :icon="['fas', 'heart']"/>
                                </span>
                            <a>
                                Списки желаний
                            </a>
                        </li>
                        <li class="side-menu__item">
                                <span class="icon">
                                    <font-awesome-icon :icon="['fas', 'bitcoin-sign']"/>
                                </span>
                            <a>
                                Мой бонусный счет
                            </a>
                        </li>
                        <li class="side-menu__item">
                                <span class="icon">
                                    <font-awesome-icon :icon="['fas', 'eye']"/>
                                </span>
                            <a>
                                Просмотренные товары
                            </a>
                        </li>
                        <li class="side-menu__item">
                                <span class="icon">
                                   <font-awesome-icon :icon="['fas', 'comment']"/>
                                </span>
                            <a>
                                Мои отзывы
                            </a>
                        </li>
                        <li class="side-menu__item">
                            <a class="side-menu__item_link">
                                О нас
                            </a>
                        </li>
                        <li class="side-menu__item">
                            <a class="side-menu__item_link"
                            @click="logout">
                                Выход из аккаунта
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="top">
            <p><img :src="'/images/leaf_1.jpg'" width="25" alt="leaf"></p>
            <router-link to="/">Mysite</router-link>
        </div>

        <ul id="sticky-menu" class="topnav">

            <li class="menu-nav">

            </li>

            <li class="menu-nav">
                <router-link class="active" to="/">Главная</router-link>
            </li>

            <li class="menu-nav">
                <router-link to="/">Уведомления</router-link>
            </li>

            <li class="menu-nav">
                <router-link to="/">Отзывы</router-link>
            </li>

            <li class="menu-nav">
                <router-link to="/chat">Chat</router-link>
            </li>
            <li class="menu-nav"><a href="#">
                <catalog-button
                    :catalogModal="catalogModal"
                >
                </catalog-button>
            </a></li>

            <li class="menu-nav-add"><a href="#">
                <cart-button
                >
                </cart-button>
            </a></li>
            <li class="menu-nav-add"><a href="#">
                <search-button>
                </search-button>
            </a></li>
            <li class="icon" @click="burgerMenu">
                <i class="fa fa-bars"></i>
            </li>
            <li class="menu-nav-add" style="position: relative;">

                <a v-if="loggedIn" v-on:click="AccountShowList">
                    <img :src="'/images/avatar.png'" width="25" alt="avatar"
                         style="cursor: pointer;">
                </a>

                <a v-else href="#" @click.stop="showLogin = !showLogin">
                    Login
                </a>
            </li>
        </ul>
    </div>

    <!--    <div class="row menu top">-->
    <!--        <div class="col-10 d-flex flex-column align-self-center justify-content-center pl-4">-->
    <!--            <div>-->
    <!--                <nav class="menu-list">-->
    <!--                </nav>-->
    <!--            </div>-->
    <!--            <range-slider-->
    <!--                @filter="filter"-->
    <!--            >-->
    <!--            </range-slider>-->
    <!--        </div>-->
    <!--        <div class="col-2 d-flex align-items-center justify-content-center cursor">-->
    <!--            <img class="cursorLeft" :src="'/images/cursorRight.png'" width="25" height="25" alt="cursorLeft">-->
    <!--        </div>-->
    <!--    </div>-->

    <login-form
        v-if="showLogin"
        @close=close
    >
    </login-form>

    <!-- -----------------------Adwertising------------------------- -->

    <!--    <div style="overflow: hidden;">-->
    <!--        <img src="https://content1.rozetka.com.ua/files/images/original/407007216.png"-->
    <!--             width="400" height="300" class="banner" alt="banner">-->
    <!--    </div>-->


</template>

<script>

import 'animate.css';
import loginForm from "../Login";
import SentEmail from "../verification/VerifyEmail";

export default {
    name: "NavBar",
    components: {
        loginForm,
        SentEmail
    },
    data: () => {
        return {
            user: {},
            avatar: '',
            showUser: false,
            showLogin: false,
            overload: false,
            cartModal: false,
            catalogModal: false,
        }
    },
    computed: {
        loggedIn() {
            return this.$store.state.auth.status.loggedIn;
        }
    },
    mounted() {
        this.getUser();
        this.topNav();
        this.activeNav();
//---------------------------Adver------------------------------------------//
        // setTimeout(() => {
        //     const advertising = document.querySelector('.banner');
        //     advertising.style.left = '58em';
        //     advertising.style.transition = 'all 3s';
        // }, 3000)

    },
    methods: {
        async getUser() {
            this.user = await this.$store.state.auth.user;
            if (this.user)
                this.avatar = this.user.lastname ?? this.user.name;
        },
        NoAvatar() {
            console.log(this.user.lastname.substr(0, 1))
            return 'Hello!!'
        },
        AccountShowList() {
            this.overload = true;
            setTimeout(() => {
                let accountList = document.querySelector('.account-list');
                this.getUser();
                accountList.style.left = '0';
                accountList.style.transition = 'all 0.6s';
            })
        },
        AccountHideList() {
            let accountList = document.querySelector('.account-list');
            accountList.style.left = '-24em';
            accountList.style.transition = 'all 0.6s';
            setTimeout(() => {
                this.overload = false;
            }, 600);

        },
        // asideMenu() {
        //     let isShow = false;
        //     let cursor = document.querySelector('.cursor');
        //     let menu = document.querySelector('.menu');
        //     cursor.addEventListener('click', function () {
        //         if (isShow === false) {
        //             isShow = true;
        //             menu.style.left = '0';
        //             cursor.style.transform = ' rotate(180deg)';
        //             cursor.style.transition = 'all .6s';
        //         } else {
        //             isShow = false;
        //             menu.style.left = '-280px';
        //             cursor.style.transform = ' rotate(360deg)';
        //             cursor.style.transition = 'all .6s';
        //         }
        //     })
        // },
        burgerMenu() {
            let x = document.getElementById("sticky-menu");
            x.classList.toggle('responsive');
        },
        topNav() {
            let navbar = document.getElementById("sticky-menu");
            let sticky = navbar.offsetTop;

            window.addEventListener('scroll', function () {
                if (window.pageYOffset >= sticky) {
                    navbar.classList.add("sticky");
                } else {
                    navbar.classList.remove("sticky");
                }
            })
        },
        close() {
            this.showLogin = false;
        },
        showMesSendEmail() {
            this.showMessageSendEmail = true;
        },
        activeNav() {
            let items = document.querySelectorAll(".topnav a");
            items.forEach((item) => {
                item.addEventListener('click', () => {
                    items.forEach((itemOther) => {
                        itemOther.classList.remove('active');
                    });
                    item.classList.add('active');
                })
            })
        },
        changeAnimate(e) {
            e.target.classList.toggle('animate__headShake');
        },
        logout() {
                return this.$store.dispatch("auth/logout").then(
                    () => {
                        this.user = {}
                        this.$router.push('/');
                    })
                    .catch((error) => {
                        console.log(error);
                    });
        },
        filter(data) {
            return this.$store.dispatch('product/SET_FILTER', data).then(() => this.$store.dispatch('product/GET_FILTER')).then(() => this.$router.push('/product/filter'));
        }
    }
}
</script>

<style scoped>

.menu {
    display: flex;
    position: fixed;
    top: 0;
    left: -280px;
    z-index: 20;
    background-color: whitesmoke;
    color: #000;
    width: 330px;
    cursor: pointer;
    height: 100%;

    /* анимация всех свойств */
    -webkit-transition: all .6s;
    -o-transition: all .6s;
    -moz-transition: all .6s;
    transition: all .6s;
}

.menu-list {
    margin-top: 100px;
    height: 100%;
    display: flex;
    font-size: 14px;
    flex-direction: column;
}

.sticky {
    position: fixed;
    top: 0;
    width: 100%;
}

.topnav {
    display: flex;
    justify-content: space-around;
    margin: 0;
    padding: 0;
    background-color: #333;
    box-shadow: 0 2px 16px 11px rgba(229, 235, 240, 0.2);
    font-weight: bold;
    font-size: 14px;
    z-index: 160;
    height: 3.2em;
}

.topnav li {
    display: flex;
    align-items: center;
    min-width: 3em;
    position: relative;
    /*padding: 4px 16px;*/
}

.topnav li a {
    display: flex;
    justify-content: center;
    align-items: center;
    font-family: 'Raleway', sans-serif;
    text-decoration: none;
    color: whitesmoke;
    min-width: 2.8em;
    min-height: 2.8em;
}

.topnav li.menu-nav a::after {
    background: #17baaa;
    content: "";
    height: 2px;
    left: 0;
    bottom: 4px;
    position: absolute;
    transform: scaleX(0);
    transition: all .5s ease;
    width: 100%;
}

.topnav li.menu-nav a:hover {
    transition: all .5s ease;
    color: #17baaa;
}

.topnav li.menu-nav a:hover::after {
    transform: scaleX(1.0);
}

/*.topnav li a:hover {*/
/*    background: rgb(121, 120, 120);*/
/*}*/

/*a:hover {*/
/*    color: #00a379;*/
/*    cursor: pointer;*/
/*    !*text-shadow: 2px 2px 4px #00a379;*!*/

/*    -webkit-animation: neon2 1.5s ease-in-out infinite alternate;*/
/*    -moz-animation: neon2 1.5s ease-in-out infinite alternate;*/
/*    animation: neon2 1.5s ease-in-out infinite alternate;*/

/*}*/

/*@keyframes neon2 {*/
/*    from {*/
/*        text-shadow: 0 0 10px #fff,*/
/*        0 0 20px  #fff,*/
/*        0 0 30px  #fff,*/
/*        0 0 40px  #228DFF,*/
/*        0 0 70px  #228DFF,*/
/*        0 0 80px  #228DFF,*/
/*        0 0 100px #228DFF,*/
/*        0 0 150px #228DFF;*/
/*    }*/
/*    to {*/
/*        text-shadow: 0 0 5px #fff,*/
/*        0 0 10px #fff,*/
/*        0 0 15px #fff,*/
/*        0 0 20px #228DFF,*/
/*        0 0 35px #228DFF,*/
/*        0 0 40px #228DFF,*/
/*        0 0 50px #228DFF,*/
/*        0 0 75px #228DFF;*/
/*    }*/
/*}*/

.menu-nav-add a {
    width: 2.8em;
}

.menu-nav-add > a:hover {
    background-color: gray;
    border-radius: 0.4em;
}

.topnav li.menu-nav a.active {
    color: #17baaa;
    opacity: 1;
    animation: flash 1s;
}

@keyframes flash {
    0% {
        opacity: .1;
    }
    100% {
        opacity: 1;
    }
}

.topnav li.icon {
    display: none;
}

@media screen and (max-width: 768px) {
    .topnav {
        z-index: 160;
        display: flex;
        justify-content: flex-start;
    }

    .topnav li {
        margin: 0;
        padding: 0;
    }

    .topnav li a {
        height: 3.2em;
    }

    .topnav li:not(:first-child) {
        display: none;
    }

    .topnav li.icon {
        color: white;
        display: flex;
        justify-content: center;
        align-items: center;
        height: inherit;
        cursor: pointer;
        margin-left: auto;
        position: absolute;
        right: 0;
    }
}

@media screen and (max-width: 768px) {
    .topnav.responsive {
        display: flex;
        flex-direction: column;
    }

    .topnav.responsive li:not(.icon) {
        display: block;
        background-color: #333;
    }

    .topnav.responsive li:hover {
        background-color: #57595c;
    }

    .topnav.responsive li.icon {
        color: white;
        display: flex;
        justify-content: center;
        align-items: center;
        height: inherit;
        cursor: pointer;
        margin-left: auto;
        position: absolute;
        right: 0;
    }
}

/*-------------------menu user---------------------*/

.fade-enter-from,
.fade-leave-to {
    transform: scaleY(0);
    transform-origin: top;
    opacity: 0;
}

.fade-enter-to,
.fade-leave-from {
    transform: scaleY(1);
    transform-origin: top;
    opacity: 1;
}

.fade-enter-active,
.fade-leave-active {
    transition: all 0.4s ease-out;
    transform-origin: top;
    /*color: rgb(51, 51, 51);*/
}


.show-user {
    position: absolute;
    background-color: rgb(121, 120, 120);
    width: 8.2em;
    height: inherit;
    top: 3.2em;
    left: -3em;
}

/*-----------------------Banner--------------------------*/

.banner {
    position: absolute;
    z-index: 110;
    top: 15em;
    left: 88em;
}

/*----------------------Account-list---------------------------*/

.overload {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 1000;
    background-color: rgba(0, 0, 0, 0.6);
}

.account-list {
    top: 0;
    left: -24em;
    width: 24em;
    position: absolute;
    pointer-events: auto;
    box-sizing: border-box;
    z-index: 1000;
    display: flex;
    max-width: 100%;
    max-height: 100%;
    background-color: white;
    overflow: auto;
}

.list {
    display: flex;
    flex-direction: column;
    height: 100%;
    width: 100%;
}

.side-menu__list {
    display: flex;
    flex-direction: column;
    padding: 0;
}

.side-menu__item {
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: flex-start;
    list-style-type: none;
    margin: 0.2em 0.6em;
    box-sizing: border-box;
    font-size: 14px;
    color: #221f1f;
    cursor: pointer;
    height: 4em;
    /*border-bottom: 1px solid #e9e9e9;*/
}

.side-menu__item:hover {
    background-color: #d0ecdb;
    border-radius: 0.5em;
    transition: all 0.4s;
}

.side-menu__item:hover .icon {
    background: none;
    transition: all 0.4s;
}

.icon {
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 0 2em;
    height: 3em;
    width: 3em;
    border-radius: 50%;
    background-color: rgb(245, 245, 245);
}

svg {
    height: 1.6em;
}

.side-menu__item_link {
    line-height: 3em;
    margin-left: 2em;
}

.side-menu__item_link:hover {
    color: inherit;
}

.side-menu__header {
    display: flex;
    flex-direction: row;
    flex-shrink: 0;
    align-items: center;
    justify-content: space-between;
    padding: 8px 8px 8px 16px;
    background-color: #221f1f;
}

.side-menu__logo {
    font-size: 1.4em;
    margin-left: 1em;
    color: rgb(61, 106, 169)
}

.side-menu__name {
    background-color: #221f1f;
}

.side-menu__auth-wrap {
    display: flex;
    align-items: center;
    justify-content: flex-start;
    margin: 0.5em;
    padding: 0.5em;
    column-gap: 16px;
    border-radius: 4px;
    color: white;
}

.side-menu__auth-wrap:hover {
    background-color: #ffffff1a;
}

.btn-close:active, :focus {
    /*outline: 0;*/
    /*border: none;*/
    box-shadow: none;
}

.side-menu__avatar {
    margin-left: 1em;
    display: flex;
    align-items: center;
    justify-content: center;
    width: 40px;
    height: 40px;
    border-radius: 50%;
    background-color: rgb(57, 54, 54);
    font-size: 24px;
    color: #fff;
}

.side-menu__auth-content {
    padding: 0 1em;
    vertical-align: baseline;
}

.side-menu__auth-caption {
    overflow: hidden;
    text-overflow: ellipsis;
    font-size: 12px;
    margin: 0;
    padding: 0;
    color: #a6a5a5;
}
</style>
