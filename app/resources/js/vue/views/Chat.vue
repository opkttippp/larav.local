<template>
    <div v-if="user" class="container py-5">
        <div class="row d-flex justify-content-center">
            <div class="col-md-12 col-lg-10 col-xl-8">
                <div class="card" id="chat2">
                    <div class="card-header d-flex justify-content-between align-items-center p-3">
                        <h5 class="mb-0">Chat</h5>
                        <div class="">
                            <span>Online users - </span>
                            <span class="badge badge-pill badge-info">{{ usersOnChat }}</span>
                        </div>
                    </div>
                    <div class="card-body" data-mdb-perfect-scrollbar="true">
                        <chat-message
                            :user="user"
                            @editMessage="SendEditMessage"
                            @deleteMessage="deleteMessage"
                        >
                        </chat-message>
                    </div>
                    <div>
                        <chat-form
                            @sendMessage="sendMessage"
                            :user="user"
                        ></chat-form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div v-else>
        You Unauthenticated!
    </div>
</template>

<script>

import ChatMessage from '../components/Chat/ChatMessage';
import ChatForm from '../components/Chat/ChatForm';
import axios from "axios";

export default {
    name: "Chat",
    components: {
        ChatMessage,
        ChatForm
    },
    data() {
        return {
            user: Object,
            usersOnChat: ''
        }
    },
    created() {
        this.getUser();
    },
    mounted() {
        this.getMainInfo();
    },
    unmounted() {
        this.leaveChannel();
    },
    methods: {
        getUser() {
            if (this.$store.state.auth.user) {
                this.user = this.$store.state.auth.user;
                window.Echo.options.auth.headers.Authorization = 'Bearer ' + window.localStorage.getItem('token')
            }else
            this.user = null;
        },
        sendMessage: (data) => {
            return axios.post('/api/chat/send', data).catch((res) => {
                this.errors = res.data.errors;
            })
        },
        SendEditMessage(data) {
            return axios.post('/api/chat/update', data).catch((res) => {
                this.errors = res.data.errors;
            })
        },
        deleteMessage: (name, id) => {
            return axios.post('/api/chat/delete', {name, id}).catch((res) => {
                this.errors = res.data.errors;
            })
        },
        getMainInfo() {
            Echo.join('chat')
                .here((users) => {
                    this.usersOnChat = users.length
                })
                .joining((user) => {
                    this.usersOnChat++;
                    this.$toast.success(`User ${user.name} is joining ...`);
                })
                .leaving((user) => {
                    this.usersOnChat--;
                    this.$toast.success(`User ${user.name} is leaving ...`);
                })
                .error((error) => {
                    console.error(error);
                });
        },
        leaveChannel() {
            Echo.leave(`chat`);
        }
    }
}
</script>

<style scoped>

</style>
