<template>
    <div class="container-fluid dark-grey-text mt-0" v-if="products">
        <v-popup class="popup"
                 v-if="isInfoPopupVisible"
                 @closePop="closePopupInfo()"
        >
            <form class="row g-3 m-2">
                <div class="col-md-12 d-flex justify-content-around align-items-center">
                    <div>
                        <img class="image"  :src="'http://larav.local/storage/' + this.user.avatar"
                             alt="images">
                    </div>
                        <div class="rating">
                        <input type="radio" id="star-1" name="rating" value="5" v-model="status">
                        <label for="star-1" title="Оценка «1»"></label>

                        <input type="radio" id="star-2" name="rating" value="4" v-model="status">
                        <label for="star-2" title="Оценка «2»"></label>

                        <input type="radio" id="star-3" name="rating" value="3" v-model="status">
                        <label for="star-3" title="Оценка «3»"></label>

                        <input type="radio" id="star-4" name="rating" value="2" v-model="status">
                        <label for="star-4" title="Оценка «4»"></label>

                        <input type="radio" id="star-5" name="rating" value="1" v-model="status">
                        <label for="star-5" title="Оценка «5»"></label>
                    </div>
                </div>
                <div class="col-md-6">
                    <label class="form-label" for="name">Name</label>
                    <input class="form-control" type="text" id="name" name="name" v-model=this.user.name>
                </div>
                <div class="col-md-6">
                    <label class="form-label" for="subject">Subject</label>
                    <input class="form-control" type="text" id="subject" name="subject" v-model=this.subject>
                </div>
                <div class="col-md-12">
                <label class="form-label">Leave feedback</label>
                <textarea class="form-control" name="review" id="review" rows=5 placeholder="..." v-model=this.review />
                </div>
                <div class="col-md-12 d-flex justify-content-end">
                    <button type="submit" class="btn btn-success" @click.prevent="sendReview()">
                        Place Order
                    </button>
                </div>
            </form>
        </v-popup>
        <div class="card">
            <div class="col-12 mt-1 mb-1">
                <p class="product_title">{{ products.title }}</p>
            </div>
            <MenuShow :products=products></MenuShow>
            <button class="btn btn-success"
                    style="width: 20%; margin-left: 75%; margin-top: 2%;"
                    @click="writeReview()">
                Оставить отзыв
            </button>
            <ul>
                <div class="m-4 " v-for="rev in review" :key="rev.id"
                     style="display: flex; flex-direction: row;">
                    <li class="col-12 d-flex justify-content-around">
                        <div class="col-2 mt-1 mb-1"
                             style="display: flex; flex-direction: column; align-items: center;">
                            <p>
                                {{ rev.user.name }}
                            </p>
                            <img class="image" :src="'http://larav.local/storage/' +  rev.user.avatar"
                                 alt="images">
                        </div>
                        <div class="col-8 mt-1 mb-1">
                            <p>
                                <StarRatingUser
                                    :id=products.id
                                    :status=rev.status
                                >
                                </StarRatingUser>
                            </p>
                            <p>
                                {{ rev.review }}
                            </p>
                            <p>
                                {{ rev.subject }}
                            </p>
                            <p>
                                {{ rev.email }}
                            </p>
                        </div>
                    </li>
                </div>
            </ul>
        </div>
    </div>
</template>

<script>

import StarRatingUser from "../components/StarRatingUser";
import MenuShow from "../components/MenuShow";
import vPopup from "../popup/v-popup";

import {mapActions, mapGetters} from 'vuex'

export default {
    name: 'Review',
    components: {
        StarRatingUser,
        MenuShow,
        vPopup
    },
    props: {
        id: String
    },
    data: () => {
        return {
            isInfoPopupVisible: false,
            subject: "",
            review: "",
            status: "",
        }
    },
    computed: {
        products() {
            return this.$store.getters['product/getProductById'](parseInt(this.id));
        },
        review() {
            return this.$store.getters['product/getReviewById'](parseInt(this.id));

        },
        user() {
            return this.$store.state.auth.user;
        }
    },
    created() {
        this.$store.dispatch('product/GET_REVIEW');
        this.$store.dispatch('product/GET_PRODUCTS_ID', (parseInt(this.id)));
    },
    methods: {
        writeReview() {
            this.isInfoPopupVisible = true
        },
        closePopupInfo() {
            this.isInfoPopupVisible = false
        },
        sendReview() {
            return axios.post('http://larav.local/api/review',
                {
                    name: this.user.name,
                    subject: this.subject,
                    review: this.review,
                    email: this.user.email,
                    product_id: this.products.id,
                    user_id: this.user.id,
                    status: this.status,
                }).then((res) => {
                (console.log(res));
                this.closePopupInfo();
                this.$store.dispatch('product/GET_REVIEW')
                });
        }
    }
};

</script>


<style scoped>

#grid {
    display: grid;
    grid-template-columns:repeat(auto-fill, minmax(25%, 1fr));
}

#grid > img {
    font-size: 1.1vw;
    background: white;
    width: 80%;
    height: 80%;
}


.rating {
    width: 200px;
    height: 40px;
    display: flex;
    flex-direction: row-reverse;
    align-items: center;
    justify-content: flex-end;
}

.rating:not(:checked)>input {
    display: none;
}

.rating:not(:checked)>label {
    width: 40px;
    cursor: pointer;
    font-size: 40px;
    color: lightgrey;
    text-align: center;
    line-height: 1;
}

.rating:not(:checked)>label:before {
    content: '★';
}

.rating>input:checked~label {
    color: gold;
}

.rating:not(:checked)>label:hover,
.rating:not(:checked)>label:hover~label {
    color: gold;
}

.rating>input:checked+label:hover,
.rating>input:checked+label:hover~label,
.rating>input:checked~label:hover,
.rating>input:checked~label:hover~label,
.rating>label:hover~input:checked~label {
    color: gold;
}

.image {
    width:85px;
    height: 85px;
    border-radius: 50%;
}
</style>
