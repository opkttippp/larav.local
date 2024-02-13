<template>

    <div class="modal fade"
         id="cartModal"
         data-bs-backdrop="static"
         data-bs-keyboard="false"
         tabindex="-1"
         aria-labelledby="cartModalTitle1"
         aria-hidden="true"
    >
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="cartModalTitle1">
                        Shopping Cart ({{ totalAmount }} Items)
                    </h5>
                    <button type="button"
                            class="btn-close shadow-none"
                            data-bs-dismiss="modal"
                            aria-label="Close">
                    </button>
                </div>
                <div v-if="!cartIsEmpty" class="modal-body p-4">
                    <cart-products-list
                        :cartProducts="cartProducts"
                    >
                    </cart-products-list>
                    <button class="btn btn-success"
                            data-mdb-backdrop="false"
                            data-bs-dismiss="modal"
                            data-bs-target="#cartModalBilling"
                            data-bs-toggle="modal"
                    >
                        Order
                    </button>
                </div>
                <div v-else class="modal-body p-4 d-flex justify-content-center">
                    <p>
                        Cart is empty...
                    </p>
                </div>
            </div>
        </div>
    </div>

    <cart-billing-form v-if="getAuth" :id="getAuth.id"
                       :Userid="getAuth.id"
                       :UserName="getAuth.name"
                       :UserLastname="getAuth.lastname"
                       :UserPhone="getAuth.phone"
                       :UserEmail="getAuth.email"
                       :UserAddress="getAuth.address"
                       :UserCartProducts="cartProducts"
    >
    </cart-billing-form>

</template>

<script>
import CartProductsList from "./CartProductsList";
import CartBillingForm from "./CartBillingForm";
import OrderModal from "./OrderModal";

export default {
    name: "CartModal",
    components: {
        CartBillingForm,
        CartProductsList,
        OrderModal
    },
    computed: {
        getAuth() {
            return this.$store.state.auth.user;
        },
        cartIsEmpty() {
            return this.$store.getters['product/cartIsEmpty'];
        },
        totalAmount() {
            return this.$store.getters['product/totalAmount'];
        },
        cartProducts() {
            return this.$store.state.product.cartProducts;
        },
    },
    methods: {
        // remove() {
        //     let data = document.querySelectorAll('.modal-backdrop');
        //     console.log(data);
        //     for (let i = 0; i < 2; ++i) {
        //         data[i].remove();
        //     }
        // }
    }
}
</script>
<style>
</style>
