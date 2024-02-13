<template>
    <div class="modal fade" id="cartModalBilling" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
         aria-labelledby="cartModalTitle2" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="cartModalTitle2">
                        Shopping Cart ({{ totalAmount }} Items)
                    </h5>
                    <button type="button" class="btn-close shadow-none" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                </div>
                <div class="modal-body p-4">
                    <form class="row g-3 mb-3">
                        <h5>Billing details</h5>
                        <div class="col-md-6">
                            <label for="name" class="form-label">Name</label>
                            <input v-model="this.name" type="text" class="form-control" id="name"
                                   placeholder="Name" name="name">
                        </div>
                        <div class="col-md-6">
                            <label for="lastname" class="form-label">Last Name</label>
                            <input v-model="this.lastname" type="text" class="form-control" id="lastname"
                                   placeholder="LastName" name="lastname">
                        </div>
                        <div class="col-12">
                            <label for="address" class="form-label">Address</label>
                            <input v-model="this.address" type="text" class="form-control" id="address"
                                   placeholder="Address" name="address">
                        </div>
                        <div class="col-md-6">
                            <label for="email" class="form-label">Email</label>
                            <input v-model="this.email" type="email" class="form-control" id="email"
                                   placeholder="Email Address" name="email">
                        </div>
                        <div class="col-md-6">
                            <label for="phone" class="form-label">Phone</label>
                            <input v-model="this.phone" type="text" class="form-control" id="phone"
                                   placeholder="+38(099) 999-99-99" name="phone">
                        </div>
                        <div class="col-md-12">
                            <label class="form-label">Comment</label>
                            <textarea class="form-control" name="comment" id="comment" rows=5 placeholder="..."
                                      v-model=comment></textarea>
                        </div>
                        <div class="col-12 d-flex justify-content-end">
                            <button type="submit" class="btn btn-success" @click.prevent="onSubmit"
                                    data-bs-target="#orderModal" data-bs-toggle="modal" data-bs-dismiss="modal">
                                Place Order
                            </button>
                            <button type="button" class="btn-close shadow-none" data-bs-dismiss="modal"
                                    aria-label="Close">
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <order-modal :name=this.name
                 :order=this.order
    >
    </order-modal>

</template>

<script>

import OrderModal from "./OrderModal";

export default {
    name: "CartBillingForm",
    components: {
        OrderModal
    },
    props: {
        Userid: Number,
        UserName : String,
        UserLastname : Number,
        UserPhone : Number,
        UserEmail : String,
        UserAddress : String,
        UserCartProducts : ''
    },
    data: function () {
        return {
            id: this.Userid,
            name: this.UserName,
            lastname: this.UserLastname,
            phone: this.UserPhone,
            email: this.UserEmail,
            address: this.UserAddress,
            cartProducts: this.UserCartProducts,
            comment: "",
            total: "",
            firstNameInvalidMsg: "",
            orderId: "",
            order: "",
        }
    },
    watch: {
        firstName(newFirstName) {
            if (newFirstName.length > 20) {
                this.firstNameInvalidMsg = "First name must be shorter than 20 characters.";
            } else {
                this.firstNameInvalidMsg = "";
            }
        }
    },
    computed: {
        isPlaceOrderDisabled() {
            return !!this.firstNameInvalidMsg;
        },
        cartIsEmpty() {
            return this.$store.getters['product/cartIsEmpty'];
        },
        totalAmount() {
            return this.$store.getters['product/totalAmount'];
        },
        totalPrice() {
            return this.$store.getters['product/totalPrice'];
        }
    },
    methods: {
        removeAll() {
            this.$store.commit("product/removeOrder")
        },
        onSubmit() {
            let data = document.querySelectorAll('.modal-backdrop');
            // console.log(data);
            for (let i = 0; i < 2; ++i) {
                data[i].remove();
            }
            return axios.post('http://larav.local/api/order',
                {
                    user_id: this.id,
                    customerName: this.name,
                    customerLastName: this.lastname,
                    customerEmail: this.email,
                    customerAddress: this.address,
                    customerPhone: this.phone,
                    comment: this.comment,
                    total: this.totalPrice,
                    cartProducts: this.cartProducts,
                }).then((res) => {
                this.order = res.data.id;
                this.sendMailOrder(res.data);
                this.removeAll();
            });
        },
        sendMailOrder(data) {
            return axios.post('http://larav.local/api/mail/order',
                data
        )}
    }
}
</script>
