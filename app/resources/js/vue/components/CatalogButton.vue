<template>
    <div @click="isModal = true">Каталог</div>
    <catalog-modal
        v-if="isModal"
        @close="close"
    >
    </catalog-modal>
</template>

<script>

import CatalogModal from "./CatalogModal";

export default {
    name: "catalog-button",
    components: {
        CatalogModal
    },
    props: {
        catalogModal: Boolean,
    },
    data() {
        return {
            isModal: false,
        }
    },
    watch: {
        catalogModal() {
            this.isModal = true;
        }
    },
    methods: {
        close() {
            this.isModal = false;
            // this.$emit('closeCatalogModal') ;
        }
    }
}
</script>

<style scoped>
</style>
