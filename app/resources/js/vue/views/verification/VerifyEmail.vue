<template>
    <card style="display: flex;
    justify-content: center;">
        <template v-if="success">
            <div class="alert alert-success" role="alert">
                {{ success }}
            </div>
        </template>

        <template v-else>
            <div class="alert alert-danger" role="alert">
                {{ error || 'failed_to_verify_email' }}
            </div>
        </template>
    </card>
</template>

<script>

import axios from 'axios'

const qs = (params) => Object.keys(params).map(key => `${key}=${params[key]}`).join('&')

export default {
    async beforeRouteEnter(to, from, next) {
        try {
            const {data} = await axios.post(`/api/email/verify/${to.params.id}?${qs(to.query)}`)

            next(vm => {
                vm.success = data.status
            })
        } catch (e) {
            next(vm => {
                vm.error = e.response.data.status
            })
        }
    },

    middleware: 'guest',

    data() {
        return {
            error: '',
            success: ''
        }
    },
    mounted() {
        setTimeout(() => {
            this.success = '';
            this.$router.push('/');
        }, 1500)
    }
}

</script>

<style scoped>


</style>
