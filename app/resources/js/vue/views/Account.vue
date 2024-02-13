<template>

    <div class="preloader"
         v-if="this.spinner">
        <div class="preloader__row">
            <div class="preloader__item"></div>
            <div class="preloader__item"></div>
        </div>
    </div>

    <div class="content">
        <div v-if="status">
            <div class="alert alert-success" role="alert">
                {{ status }}
            </div>
        </div>
        <div v-if="error">
            <div class="alert alert-success" role="alert">
                {{ error }}
            </div>
        </div>
        <h1 class="cabinet__heading">Личные данные</h1>
        <div class="block">
            <div class="header">
                <svg viewBox="0 0 24 24" id="icon-user-rounded">
                    <path clip-rule="evenodd" d="m23 12c0 2.9523-1.163 5.6329-3.0559
                7.6087-.0547.0571-.11.1136-.1659.1695-1.9906 1.9906-4.7406 3.2218-7.7782 3.2218-3.12288
                 0-5.94181-1.3013-7.94409-3.3913-1.89288-1.9758-3.05591-4.6564-3.05591-7.6087 0-6.07513
                  4.92487-11 11-11 6.0751 0 11 4.92487 11 11zm-11 9c.0971 0 .1938-.0015.2901-.0046
                  2.0729-.0656 3.9689-.8322 5.4588-2.0705-.7245-2.2068-2.955-3.9249-5.7489-3.9249-2.79387
                   0-5.02438 1.7181-5.74891 3.9249 1.4783 1.2286 3.35631 1.9928
                   5.41021 2.0688.1124.0042.2253.0063.3387.0063zm-3.36834-7.3048c-1.70723.744-3.08768
                   2.0361-3.88418 3.6351-1.09844-1.4921-1.74748-3.3354-1.74748-5.3303 0-4.97056
                   4.02944-9 9-9 4.9706 0 9 4.02944 9 9 0 1.9949-.649 3.8382-1.7475 5.3303-.7965-1.599-2.1769-2.8911-3.8842-3.6351
                   1.0026-.9144 1.6317-2.2313 1.6317-3.6952 0-2.76142-2.2386-5-5-5-2.76142 0-5 2.23858-5 5 0
                   1.4639.62909 2.7808 1.63166 3.6952zm3.36834-.6952c1.6569 0 3-1.3431 3-3 0-1.65685-1.3431-3-3-3s-3
                   1.34315-3 3c0 1.6569 1.3431 3 3 3z" fill-rule="evenodd"></path>
                </svg>
                <h3 class="personal-section__heading">Личные данные</h3>
                <div class="d-flex align-items-center justify-content-center cursor">
                    <img class="cursorDown" :src="'/images/cursorDown.png'" width="25" height="25" alt="cursorDown">
                </div>
            </div>
            <div class="personal-section__body">
                <div class="personal-data" v-if="!editMain">
                    <ul class="personal-data__list">
                        <li class="personal-data__item">
                            <label for="lastName" class="personal-data__label"> Фамилия </label>
                            <p class="personal-data__value"> {{ user.lastname }} </p>
                        </li>
                        <li class="personal-data__item">
                            <label for="firstName" class="personal-data__label"> Имя</label>
                            <p class="personal-data__value ng-star-inserted"> {{ user.name }} </p>
                        </li>
                        <li class="personal-data__item">
                            <label for="secondname" class="personal-data__label">
                                Отчество </label>
                            <p class="personal-data__value ng-star-inserted"> {{ user.secondname }} </p>
                        </li>
                        <li class="personal-data__item" style="height: 6em;">
                            <label for="image" class="personal-data__label">
                                Аватар </label>
                            <div v-if="this.user.avatar"
                                 class="view">
                                <img :src="'http://larav.local/storage/' + user.avatar" alt="leaf"
                                     class="avatar">
                            </div>
                            <div v-else
                                 class="side-menu__avatar view">
                                <div>
                                    {{ this.avatar.substr(0, 1) }}
                                </div>
                            </div>
                        </li>
                        <li class="personal-data__item">
                            <label for="birthday" class="personal-data__label">
                                Дата рождения </label>
                            <p class="personal-data__value ng-star-inserted"> {{ user.birthday }} </p>
                        </li>
                    </ul>
                    <div class="personal-data__footer">
                        <button class="btn btn-success personal-data__edit"
                                @click.prevent.stop="editMain = !editMain"
                        > Редактировать
                        </button>
                    </div>
                </div>

                <div class="personal-data" v-else>
                    <ul class="personal-data__list">
                        <li class="personal-data__item">
                            <label for="lastName" class="personal-data__label"> Фамилия </label>
                            <p>
                                <input v-model="user.lastname" class="form-control" id="lastName" name="lastName">
                            </p>
                        </li>
                        <li class="personal-data__item">
                            <label for="name" class="personal-data__label"> Имя</label>
                            <p>
                                <input v-model="user.name" class="form-control" id="name" name="name">
                            </p>
                        </li>
                        <li class="personal-data__item">
                            <label for="secondname" class="personal-data__label">
                                Отчество </label>
                            <p>
                                <input v-model="user.secondname" class="form-control" id="secondname" name="secondname">
                            </p>
                        </li>
                        <li class="personal-data__item" style="height: 6em;">
                            <label for="image" class="personal-data__label">
                                Аватар </label>
                            <div style="display: flex;
                                 flex-direction: column;
                                 justify-content: center;
                                 align-items: flex-start;
                                 ">
                                <div v-if="this.user.avatar" class="view">
                                    <img :src="'http://larav.local/storage/' + user.avatar" alt="leaf"
                                         class="avatar">
                                    <button class="phone-delete"
                                            @click="() => {
                                       this.user.avatar = '';
                                       this.imageChanged = false;
                                    }">
                                        <span class="fa fa-trash">
                                        </span>
                                    </button>
                                </div>
                                <div v-else class="side-menu__avatar view">
                                    <div>
                                        {{ this.avatar.substr(0, 1) }}
                                    </div>
                                </div>
                                <input type="file" class="loadImage" accept="image/*" @change="showImage"
                                       id="file-input" title=""
                                       style="margin: 3em 1em;">
                            </div>
                        </li>
                        <li class="personal-data__item">
                            <label for="birthday" class="personal-data__label">
                                Дата рождения </label>
                            <p>
                                <input type="date" v-model="user.birthday" class="form-control" id="birthday"
                                       name="birthday">
                            </p>
                        </li>
                    </ul>
                    <div class="personal-data__footer">
                        <button class="btn btn-success personal-data__edit"
                                @click="SaveChange"
                        >Сохранить
                        </button>
                        <button type="button" class="btn button--link"
                                @click.prevent.stop="editMain = !editMain"
                        > Отмена
                        </button>
                    </div>
                </div>
            </div>

        </div>
        <div class="block">
            <div class="header">
                <svg viewBox="0 0 24 24" id="icon-envelopment-open">
                    <path
                        d="m23.1055 7.8164-9.8182-7.145456c-.3737-.273051-.8245-.420212-1.2873-.420212s-.9136.147161-1.2873.420212l-9.818147 7.145456c-.277959.20311-.503909.46912-.659382.77627-.1554734.30716-.23605677.64674-.23516366.991v12.00003c0 .5786.22986966 1.1336.63903966 1.5428.409173.4091.964123.639 1.542783.639h19.63637c.5786 0 1.1336-.2299 1.5428-.639.4091-.4092.639-.9642.639-1.5428v-12.00003c.0009-.34426-.0797-.68384-.2352-.991-.1554-.30715-.3814-.57316-.6593-.77627zm-14.54186 7.4618-6.38181 5.1055v-9.5018zm2.75996.5891c.1926-.1522.4309-.235.6764-.235s.4838.0828.6764.235l7.1236 5.6946h-15.59999zm4.1128-.5891 6.3818-4.3636v9.5018zm-3.4364-12.83998 8.8691 6.44727-7.2545 4.98541c-.4976-.2872-1.0619-.4384-1.6364-.4384s-1.1389.1512-1.6364.4384l-7.21088-4.98541z"></path>
                </svg>
                <h3 class="personal-section__heading">Контакты</h3>
                <div class="d-flex align-items-center justify-content-center cursor">
                    <img class="cursorDown" :src="'/images/cursorDown.png'" width="25" height="25" alt="cursorDown">
                </div>
            </div>
            <div class="personal-section__body">
                <div class="personal-data" v-if="!editLink">
                    <ul class="personal-data__list">
                        <li class="personal-data__item">
                            <label for="phone" class="personal-data__label"> Потвержденный телефон </label>
                            <p class="personal-data__value"> {{ this.user.phone }} </p>
                        </li>
                        <li class="personal-data__item">
                            <label for="email" class="personal-data__label">Электронная почта</label>
                            <p class="personal-data__value ng-star-inserted"> {{ this.user.email }} </p>
                        </li>
                    </ul>
                    <div class="personal-data__footer">
                        <button class="btn btn-success personal-data__edit"
                                @click="editLink=!editLink"
                        > Редактировать
                        </button>
                    </div>
                </div>


                <div class="personal-data" v-else>
                    <ul class="personal-data__list">
                        <li class="personal-data__item">
                            <label for="phone" class="personal-data__label"> Потвержденный телефон </label>
                            <div style="display: flex;">
                                <!--                                <input v-model="this.user.phone" class="form-control" id="phone" name="phone">-->
                                <MaskInput id="phone" v-model="this.user.phone" mask="+38-###-#######"
                                           class="form-control" :value="this.user.phone"/>
                                <button v-if="this.user.phone"
                                        class="phone-delete">
                                    <span class="fa fa-trash"
                                          @click="isPhoneModal=true"
                                    ></span>
                                </button>
                            </div>
                        </li>
                        <li class="personal-data__item">
                            <label for="email" class="personal-data__label">Электронная почта</label>
                            <p class="personal-data__value ng-star-inserted">
                                <input v-model="this.user.email" class="form-control" id="email" name="email">
                            </p>
                        </li>
                    </ul>
                    <div class="personal-data__footer">
                        <button class="btn btn-success personal-data__edit"
                                @click="SaveChange"
                        >Сохранить
                        </button>
                        <button type="button" class="btn button--link"
                                @click.prevent.stop="editLink = !editLink"
                        > Отмена
                        </button>
                    </div>
                </div>
            </div>


        </div>
        <button type="button" class="button button--medium button--link"
                @click="isPassModal=true"
        > Изменить пароль
        </button>
        <button type="button" class="button button--medium button--link"
                @click="isAccountModal=true"
        > Удалить аккаунт
        </button>
        <button type="button" class="button button--medium button--link"
                @click="this.Logout"
        > Выход
        </button>
    </div>
    <password-modal
        v-if="isPassModal"
        @close="close"
    >
    </password-modal>
    <phone-modal
        v-if="isPhoneModal"
        @close="close"
        @PhoneDel="PhoneDel"
        :phone=this.user.phone
    >
    </phone-modal>
    <account-modal
        v-if="isAccountModal"
        @close="close"
        @AccountDel="AccountDel"
        :name=this.user.name
    >
    </account-modal>
</template>

<script>

import PasswordModal from "../components/PasswordModal"
import PhoneModal from "../components/PhoneModal"
import AccountModal from "../components/AccountModal"
import {MaskInput} from 'vue-3-mask';

export default {
    name: "Account",
    components: {
        PasswordModal,
        AccountModal,
        PhoneModal,
        MaskInput
    },
    data() {
        return {
            user: {},
            avatar: '',
            error: '',
            status: '',
            editMain: false,
            editLink: false,
            isPassModal: false,
            isPhoneModal: false,
            isAccountModal: false,
            imageChanged: false,
            spinner: false,
        }
    },
    mounted() {
        this.AnimationList();
        this.User();
    },
    computed: {},
    methods: {
        async User() {
            let getUser = await this.$store.state.auth.user;
            this.user.name = getUser.name;
            this.user.lastname = getUser.lastname ?? '';
            this.user.secondname = getUser.secondname ?? '';
            this.user.avatar = getUser.avatar ?? '';
            this.user.birthday = getUser.birthday ?? '';
            this.user.phone = getUser.phone ?? '';
            this.user.email = getUser.email ?? '';
            this.avatar = this.user.lastname ?? this.user.name;
        },
        AnimationList() {
            let header = document.querySelectorAll('.header');
            header.forEach((item) => {
                let isShow = false;
                item.addEventListener('click', function () {
                    let block = item.closest('.block');
                    let cursor = item.querySelector('.cursorDown');
                    if (isShow === false) {
                        isShow = true;
                        block.style.height = 'auto';
                        block.style.transition = 'all 0.6s';
                        cursor.style.transform = ' rotate(180deg)';
                        cursor.style.transition = 'all .6s';
                    } else {
                        isShow = false;
                        block.style.height = '5em';
                        block.style.transition = 'all .6s';
                        cursor.style.transform = '';
                        cursor.style.transition = 'all .6s';
                    }
                })
            })
        },
        showImage() {

            let view = document.querySelector('.view');
            let file = document.querySelector('.loadImage[type=file]').files[0];
            let img = document.createElement("img");
            if (file) {
                while (view.firstChild) {
                    view.removeChild(view.firstChild);
                }
            }
            img.style = "height: 5rem;" +
                "width: 5rem;" +
                "border: 1px solid darkgrey;" +
                "object-fit: cover;" +
                "background-color: #fff;" +
                "border-radius: 50%";

            let reader = new FileReader();
            reader.onloadend = function () {
                img.src = reader.result;
                view.appendChild(img);
            }
            if (file) {
                reader.readAsDataURL(file);
                reader.onload = () => {
                    file.previewBase64 = reader.result
                }
                this.imageChanged = file;
            } else {
                img.src = "";
            }
        },
        close() {
            this.isPassModal = false;
            this.isPhoneModal = false;
            this.isAccountModal = false;
        },
        PhoneDel() {
            this.close();
            this.editLink = false;
            this.user.phone = '';
            this.SaveChange();
        },
        AccountDel() {
            this.close();
            this.DeleteAccount();
        },
        async SaveChange() {
            this.spinner = true;
            let newUser = new FormData();
            newUser.append('_method', 'PATCH');
            if (this.imageChanged) {
                delete this.user.avatar;
                newUser.append('avatar', this.imageChanged);
            }

            const keys = Object.keys(this.user);
            keys.forEach(key => {
                newUser.append(`${key}`, `${this.user[key]}`);
            });
            const {data} = await axios.post('http://larav.local/api/account/update',
                newUser, {
                    'Content-Type': 'multipart/form-data'
                }
            );
            await this.UpdateUser();
            this.status = await data.status;
            setTimeout(() => {
                this.status = '';
            }, 3000)
        },
        async UpdateUser() {
            this.$store.dispatch("auth/updateUser").then(
                () => {
                    this.User();
                    this.CloseEditForms();
                })
                .catch((error) => {
                    console.log(error);
                });
        },
        async DeleteAccount() {
            try {
                const {data} = await axios.post('http://larav.local/api/account/delete', {
                    email: this.user.email
                });
                this.status = await data.status;
                return this.$store.dispatch("auth/logout").then(
                    () => {
                        setTimeout(() => {
                            this.status = '';
                            this.$router.push('/');
                        }, 3000)
                    })
                    .catch((error) => {
                        console.log(error);
                    });
            } catch (data) {
                this.error = await data.error;
            }

        },
        Logout() {
            return this.$store.dispatch("auth/logout").then(
                () => {
                    this.user = {}
                    this.$router.push('/');
                })
                .catch((error) => {
                    console.log(error);
                });
        },
        CloseEditForms() {
            this.editMain = false;
            this.editLink = false;
            this.spinner = false;
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
    margin-bottom: 1em;
    padding-top: 1em;
    padding-bottom: 3em;
}

.cabinet__heading {
    font-size: 2em;
    padding: 0 1em;
}

.block {
    margin: 1em;
    padding: 0;
    height: 5em;
    border: 1px solid rgb(121, 120, 120);
    border-radius: 5px;
    overflow: hidden;
}

.header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin: 0;
    padding: 24px;
    cursor: pointer;
    /*border: 1px solid #0f401b;*/
    outline: none;
    vertical-align: baseline;
}

svg {
    flex-shrink: 0;
    width: 24px;
    height: 24px;
    align-items: center;
    margin-right: 1em;

}

.personal-section__heading {
    flex-grow: 1;
    padding: 0;
    margin: 0 16px;
    font-family: Arial, Segoe UI, Roboto, Helvetica, sans-serif;
    font-size: 18px;
    font-weight: 600;
    line-height: 1;
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

.personal-section__body {
    padding: 1em 2em 2em 4em;
    margin: 0;
    border: 0;
    vertical-align: baseline;
}

.personal-data__list {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    column-gap: 24px;
    list-style: none;
}

.personal-data__label {
    font-size: 12px;
    font-weight: normal;
    color: rgb(121, 120, 120);
}

.personal-data__value {
    font-size: 14px;
}

.avatar {
    height: 5em;
    width: 5em;
    object-fit: cover;
    border: 1px solid darkgrey;
    border-radius: 50%;
}

.view {
    /*margin-left: 3rem;*/
}

.side-menu__avatar {
    height: 5rem;
    width: 5rem;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: rgb(57, 54, 54);
    font-size: 24px;
    color: #fff;
    border: 1px solid darkgrey;
    border-radius: 50%;
}

.personal-data__footer {
    display: flex;
    flex-direction: row;
    align-items: center;
    margin: 0;
    padding: 0;
    border: 0;
    vertical-align: baseline;
}

.button--link {
    display: flex;
    color: #3e77aa;
    margin: 0.5em;
    border: none;
    font: inherit;
    min-width: 12em;
    background-color: transparent;
}

.button--link:hover {
    color: #ff7876;
}

.form-control:active, :focus {
    outline: 0;
    border: none;
}

/*----------------------Preloader-----------------------*/

.preloader {
    position: fixed;
    left: 0;
    top: 0;
    right: 0;
    bottom: 0;
    background: #e0e0e0;
    z-index: 1001;
}

.preloader__row {
    position: relative;
    top: 50%;
    left: 50%;
    width: 70px;
    height: 70px;
    margin-top: -35px;
    margin-left: -35px;
    text-align: center;
    animation: preloader-rotate 2s infinite linear;
}

.preloader__item {
    position: absolute;
    display: inline-block;
    top: 0;
    background-color: #337ab7;
    border-radius: 100%;
    width: 35px;
    height: 35px;
    animation: preloader-bounce 2s infinite ease-in-out;
}

.preloader__item:last-child {
    top: auto;
    bottom: 0;
    animation-delay: -1s;
}

@keyframes preloader-rotate {
    100% {
        transform: rotate(360deg);
    }
}

@keyframes preloader-bounce {

    0%,
    100% {
        transform: scale(0);
    }

    50% {
        transform: scale(1);
    }
}

.loaded_hiding .preloader {
    transition: 0.3s opacity;
    opacity: 0;
}

.loaded .preloader {
    display: none;
}

/*------------------Phone-delete-----------------------*/


.fa:hover {
    color: rgb(255, 120, 118);
}

.phone-delete {
    margin-left: 1rem;
    border: none;
    font: inherit;
    color: inherit;
    background-color: transparent;
}
</style>
