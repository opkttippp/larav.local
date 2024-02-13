<template>
    <ul class="messages">
        <li class="message pl-4 pr-4 m-2" v-for="(message, index) in this.messages" :key="message.id"
        >
                    <span class="message-data">
                        {{ setDate(message.created_at) }}
                    </span>
            <div v-if="!message.delete_message"
                 :class="[ this.user.id !== message.user_id ? 'message-guest' : 'message-one']"
            >
                <div class="image">
                    <img class="img-fluid rounded-5" :src="'http://larav.local/storage/' + message.user.avatar"
                         style="width: 2rem; height: 2rem;" alt="photo">
                </div>

                <div class="message-main"
                     :style="[ this.user.id !== message.user_id ? 'background-color: rgb(239, 239, 239);border-radius: 0 12px 12px 12px;' :
                      'background-color: rgb(216, 235, 255);border-radius: 12px 0 12px 12px;']"
                     @click.stop="isEdit(index)"
                     v-on:mouseover.self = "onShadow($event, message.user_id)"
                     v-on:mouseleave = "offShadow($event, message.user_id)"
                >
                    <p class="user">
                        {{ this.user.id !== message.user_id ? message.user.name : '' }}</p>
                    <div class="message-body"
                         :style="[ this.user.id !== message.user_id ? 'text-align: left;' : 'text-align: right;']"
                    >
                        {{ message.message }}
                    </div>

                    <div class="small mt-2 ml-2 mr-2 rounded-3">
                        <p class="message-time">
                            {{ setTime(message.created_at) }}
                        </p>
                    </div>
                </div>
                <div v-if="message.isShowEdit"
                >
                    <div v-if="this.user.id === message.user_id"
                         class="edit"
                         v-click-outside = "() => { message.isShowEdit = false }"
                    >
                        <div class="badg" @click="editMessage(message)">
                            <i class="fa fa-sharp fa-solid fa-pen-nib"></i>Edit
                        </div>
                        <div class="badg" @click="this.$emit('deleteMessage', user.name, ( message.id))">
                            <i class="fa fa-solid fa-trash"></i>
                            Delete
                        </div>
                    </div>
                </div>
            </div>
            <div v-else
                 class="d-flex justify-content-between p-2"
            >
                <div style="width: 80%; display: flex; flex-direction: column; justify-content:space-between;">
                    <div class="d-flex">
                        <p class="small ml-2 mr-2  pl-2 pr-2 rounded-3"
                        >{{ message.message }}</p>
                    </div>
                </div>
            </div>
        </li>
    </ul>
    <modal-show
        v-if="isModal"
    >
        <template v-slot:header>
            Edit message
            <button
                type="button"
                class="btn-close"
                @click="close"
                aria-label="Close modal"
            >
            </button>
        </template>
        <template v-slot:body>
            <div class="col-12 d-flex flex-column">
                <div class="col-12">
                                <textarea v-model="editMessages.message" class="form-control"
                                          @keyup.enter="this.$emit('editMessage', (editMessages))"
                                ></textarea>
                </div>
                <div>
                    <button class="m-3 btn btn-success"
                            @click="this.$emit('editMessage', (editMessages))"
                    >
                        Save
                    </button>
                </div>
            </div>
        </template>
    </modal-show>

</template>

<script>

import axios from "axios";

export default {
    name: 'chat-message',
    props: {
        user: {
            type: Object,
            chat: Object,
        }
    },
    data() {
        return {
            messages: {},
            editMessages: {},
            dateNow: '',
            date: '',
            isModal: false,
            dataMessage: '',
        }
    },
    mounted() {
        this.listenEvent();
        this.getMessages();
    },
    computed: {
        toDay() {
            return this.setDateNow();
        }
    },
    methods: {
        listenEvent() {
            Echo.private('chat')
                .listen('MessageSent', (e) => {
                    this.chat = e.message
                    this.chat.user = e.user;
                    this.messages.push(this.chat);

                    setTimeout(() => {
                        let element = document.querySelector('.messages')
                        element.scrollTop = element.scrollHeight;
                    }, 1)
                })
                .listen('MessageDelete', (e) => {
                    this.getMessages();
                    setTimeout(() => {
                        let element = document.querySelector('.messages')
                        element.scrollTop = element.scrollHeight;
                    }, 1)
                }).listen('MessageUpdate', (e) => {
                this.getMessages();
                this.close();
            });
        },
        setTime(data) {
            const current = new Date(data);
            return `${current.getHours()}:${current.getMinutes()}`;
        },
        setDateNow() {
            const current = new Date();
            return `${current.getDate()}.${current.getMonth() + 1}.${current.getFullYear()}`;
        },
        setDate(data) {
            const current = new Date(data);
            let date = `${current.getDate()}.${current.getMonth() + 1}.${current.getFullYear()}`;

            if (date === this.date) {
                return '';
            }

            if (date === this.toDay) {
                this.date = this.toDay;
                return 'Today';
            }
            this.date = date;
            return this.date;
        },
        getMessages() {
            return axios.get('/api/chat/messages').then((res) => {
                let mass = res.data;
                this.messages = mass.map(n => {
                    return {...n, 'isShowEdit': false}
                });
            })
        },
        editMessage(e) {
            this.isModal = true;
            this.editMessages = e;
        },
        isEdit(index) {
            this.messages.forEach( n => {
               return this.messages[index] === n ? this.messages[index] : n.isShowEdit = false
            });
            this.messages[index].isShowEdit = !this.messages[index].isShowEdit;
        },
        onShadow(e, user) {
            if(this.user.id === user){
                e.target.style.boxShadow = '0px 0px 27px -3px rgba(0, 75, 147, 1)';
            }
        },
        offShadow(e) {
            e.target.style.boxShadow = "inherit";
        },
        close() {
            this.isModal = false;
        }
    }
}

</script>

<style scoped>

.user {
    color: rgb(133, 120, 220);
    font-size: 0.8em;
    margin: 6% 0;
    padding-left: 10%;
    font-family: sans-serif, Verdana;
}

.messages {
    margin: 0;
    padding: 0;
}

.message {
    display: flex;
    flex-direction: column;
    list-style-type: none;
    border-radius: 15%;
    height: auto;
}

.message-one {
    display: flex;
    flex-direction: row-reverse;
    align-self: flex-end;
    max-width: 80%;
    min-width: 18%;
    width: 100%;
    height: auto;
}

.message-guest {
    align-self: flex-start;
    display: flex;
    flex-direction: row;
    max-width: 80%;
    min-width: 18%;
    width: 100%;
    height: auto;
}

.image {
    margin: 0 2%;
}

.message-body {
    overflow-wrap: break-word;
    padding: 0 10px;
    font-size: 0.8em;
}

.message-data {
    text-align: center;
    color: rgb(179, 181, 202);
    font-size: 0.8em;
}

.message-time {
    text-align: end;
    color: rgb(179, 181, 202);
    margin: auto;
    font-size: 0.8em;
    font-style: italic;
}

.message-main {
    padding: 0 10px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    max-width: 50%;
    min-width: 25%;
}




.edit {
    position: relative;
    background-color: rgb(216, 235, 255);
    margin-right: 1em;
    cursor: pointer;
}

.edit::after {
    content: '';
    position: absolute;
    right: -14px;
    top: 25px;
    border: 5px solid transparent;
    border-left: 10px solid rgb(216, 235, 255);
}

.badg {
    text-align: left;
    padding: 0.5em;
    width: 6em;
    color: #696b6e;
    font-family: sans-serif, Verdana;
    font-size: 0.8em;
}

.badg:hover {
    background-color: #4287f5;
    color: white;
    /*transform: scale(1.2);*/
    /*transition: all 0.3s;*/
}


</style>
