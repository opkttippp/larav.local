<template>

    <div id="body">
        <div class="container">
            <div class="container-user" style="display: flex; align-items: center;">
                <div>
<!--                    <a href="#" class="icon-site">-->
<!--                        <img style="width:auto; height: 30px;" alt="Відкриті клитки "-->
<!--                             src='https://opencages.com.ua/_nuxt/img/logo-light.9a60eb5.svg'>-->
<!--                    </a>-->
                </div>
                <ul class="menu-user">
                    <li>
                        <a href="#">Главная</a>
                    </li>
                    <li>
                        <a href="#">О нас</a>
                    </li>
                    <li>
                        <!--                        <input type="file" v-on:change='readFile'>-->

                                                <div id="elem">Get point</div>

                        <a href="#">Товары</a>
                    </li>
                    <li>
                        <a href="#">Вход</a>
                    </li>
                    <li>
                        <a href="#">
                            <svg class="svg" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="heart"
                                 role="img"
                                 xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                <path fill="currentColor"
                                      d="M462.3 62.6C407.5 15.9 326 24.3 275.7 76.2L256 96.5l-19.7-20.3C186.1 24.3 104.5 15.9 49.7 62.6c-62.8 53.6-66.1 149.8-9.9 207.9l193.5 199.8c12.5 12.9 32.8 12.9 45.3 0l193.5-199.8c56.3-58.1 53-154.3-9.8-207.9z"
                                >
                                </path>
                            </svg>
                            <span>likes</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>


</template>

<script>

'use strict';

// import '../../tests/test';

export default {
    name: "Home",
    mounted() {
        this.javaScript();
    },
    methods: {
        visOn() {
            document.querySelector('#src').style.display = 'block';
        },
        visOff() {
            document.querySelector('#src').style.display = 'none';
        },
        getVision(id, noShow, todo) {
            document.querySelector('#src').style.display = todo;
            document.getElementById(id).disabled = true;
            document.getElementById(noShow).disabled = false;
        },
        async javaScript() {

            let users = [
                {id: 1, name: "Вася"},
                {id: 2, name: "Петя"},
                {id: 3, name: "Маша"}
            ];

            const student = {
                name: 'John',
                age: 30,
                isAdmin: false,
                courses: ['html', 'css', 'js'],
                wife: null
            };

            let sayHiMixin = {
                sayHi() {
                    alert(`Привет, ${this.name}`);
                },
                sayBye() {
                    alert(`Пока, ${this.name}`);
                }
            };

            class User {
                constructor(name) {
                    this.name = name;
                }

                user() {
                    return this;
                }
            }

            class Users {
            }

            const user = new User('Avika')
            Object.assign(User.prototype, sayHiMixin);

            //    let mass = fetch('https://jsonplaceholder.typicode.com/users/1/posts');
            //    mass.then(response => response.json())
            //        .then(json => console.log(json))
            //        .catch(err => console.log(err.message));

            // async function fun() {
            //     let response = await fetch('https://jsonplaceholder.typicode.com/users/1/posts');
            //     // let res = await response.json();
            //     const res = response.body.getReader();
            //     const {done, value} = await res.read();
            //     return console.log(`Получено ${value.length} байт`)
            // }
            // await fun();

            // console.log(obj.age);

            /*            navigator.geolocation.getCurrentPosition(
                            position => {
                                console.log("Широта:", position.coords.latitude);
                                console.log("Довгота:", position.coords.longitude);
                            }
                        );*/


            // async function getIPFromAmazon() {
            //     return fetch('http://ipwho.is/')
            //         .then((res) => res.text())
            //         .then(data => JSON.parse(data))
            // }


            let link = document.createElement('a');

            // link.download = 'hello.txt';
            // let blob = new Blob(['Hello, world!'], {type: 'text/plain'});
            // link.href = URL.createObjectURL(blob);
            // link.click();
            // URL.revokeObjectURL(link.href);
            let response = await fetch('/article/fetch/logo-fetch.svg');
            let blob = await response.blob(); // скачиваем как Blob-объект


            let str = 'Hello Andre!!';



//shallow copy
            /* let obj1 = {...obj};
             let obj2 = Object.assign({}, obj);*/
//Deep copy

// let obj111 = JSON.parse(JSON.stringify(obj));
//Deep copy mySelf

            /*             function city(obj){
                             let clone = {}
                             for (let key in obj) {
                                 if(typeof obj[key] !== "object"){
                                     clone[key] = obj[key];
                                 } else {
                                     clone[key] = {...city(obj[key])} ;
                                 }
                             }return clone;
                         }*/

//Deep copy lodash
//             let objLodash = _.cloneDeep(obj);
        }
    }
}


</script>

<style scoped lang="scss">

/*.container {
    width: 800px;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: rgb(107, 115, 241);
    font-family: sans-serif;
}*/

.container-windows {
    width: 80%;
    height: 80%;
    color: #ffffff;
    background-color: rgb(42, 0, 119);
    border-radius: 15px;
    box-sizing: border-box;
    padding: 25px;
}

#todo {
    margin-top: 30px;
    display: flex;
    justify-content: space-between;
    padding: 0 10px;
}

#todo input {
    width: 60%;
    height: 36px;
    outline-color: orangered;
}

#todo button {
    width: 30%;
    height: 36px;
    background-color: red;
}

.list {
    /*margin-top: 58px;*/
    /*color: #ffffff;*/
    /*margin-top: 20px;*/
    /*list-style: none;*/
    /*padding: 0 10px;*/

}

.list li {
    display: flex;
    flex-direction: column;
    background-color: whitesmoke;
    color: #1a1e21;
    border-radius: 20px;
    justify-content: space-between;

}

.enter {

}

.list-user {
    color: white;
    list-style-type: none;
}

.chart-container::v-deep .chart {
    width: 30px;
    margin: 10px;
}

//----------------------------------------------------------------------------------------
#body {
    position: relative;
}

.container {
    width: 800px;
    height: 400px;
    padding: 0;
    font-family: 'Raleway', sans-serif;
    //background-image: url('https://opencages.com.ua/_nuxt/img/homepage.0151b74.jpg.webp');
    background-size: cover;
    background-attachment: fixed;
}

.container::after {
    background: #0c3632;
    content: "";
    width: 800px;
    height: 400px;
    opacity: .95;
    position: absolute;
    transition: all .25s ease;
}

.container-user {
    display: flex;
    justify-content: space-between;
    position: relative;
    z-index: 1;
    width: 100%;
    height: 50px;
    //line-height: 50px;
    background-color: #26313b;
    font-weight: bold;
    font-size: 14px;
}

.menu-user {
    display: flex;
    align-items: center;
    justify-content: flex-end;
    margin: 0;
    padding: 0;
}

.menu-user li {
    position: relative;
    list-style-type: none;
    color: white;
    padding: 0 10px;
}

.menu-user li a {
    position: relative;
    text-decoration: none;
    color: inherit;
}

.menu-user li a::after {
    background: #17baaa;
    bottom: -8px;
    content: "";
    height: 2px;
    left: 0;
    position: absolute;
    transform: scaleX(0);
    transition: all .5s ease;
    width: 100%;
}

.menu-user li a:hover {
    transition: all .5s ease;
    color: #17baaa;
}

.menu-user li a:hover::after {
    transform: scaleX(1.0);
}

.menu-user li:last-child a {
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 7px 7px;
    background-color: #dd3d53;
    border-radius: 7px;
    transition: all 0.5s ease;
}

.menu-user li:last-child a:hover {
    background-color: #dd3d20;
    color: white;
}

.menu-user li:last-child a:hover::after {
    transform: scaleX(0);
}

.menu-user li:last-child a:hover .svg {
    background-color: #dd3d20;
    color: white;
    animation: heart 1s 3;
}


.icon-site {
    margin: 0 10px;
    height: 30px;
    width: 80px;
}

.svg {
    box-sizing: content-box;
    margin: 0 10px;
    width: 20px;
}

@keyframes heart {
    from {
        transform: scale(1);
    }

    50% {
        transform: scale(1.25);
    }

    to {
        transform: scale(1);
    }
}

@media screen and (max-width: 800px) {
    .menu-user li a {
        display: none;
    }
}

#elem {
    transition: background-color 3s;
}
</style>
