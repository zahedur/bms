<template>
    <div>
        <div class="page-heading">
            <div class="page-title">
                <div class="row">
                    <div class="col-12 col-md-6 order-md-1 order-last">
                        <h3>Products</h3>
                    </div>
                    <div class="col-12 col-md-6 order-md-2 order-first">
                        <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><router-link :to="{ name: 'dashboard' }">Dashboard</router-link></li>
                                <li class="breadcrumb-item active" aria-current="page">Products</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <div class="page-content">
            <div class="row">
                <div class="col-md-7 order-2 order-md-1">
                    <div class="card">
                        <div class="card-header py-3 bg-gray50">
                            <div class="d-flex align-items-center justify-content-between">
                                <h4 class="card-title">Products List</h4>
                            </div>
                        </div>
                        <div class="card-content p-4">
                            <div v-if="products.data && products.data.length" >
                                <div class="table-responsive">
                                    <table class="table table-bordered mb-0">
                                        <thead>
                                        <tr>
                                            <th class="text-center">#</th>
                                            <th>Name</th>
                                            <th class="text-center">Material</th>
                                            <th class="text-center">ACTION</th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        <tr v-for="(product, i) in products.data">
                                            <td class="text-center">{{ i+products.from }}</td>
                                            <td>{{ product.name }}</td>
                                            <td class="text-center">{{ product.totalMaterial }}</td>
                                            <td class="text-center">
                                                <button class="btn btn-info btn-sm" @click="viewProduct(product.id)">View</button>
                                                <button class="btn btn-success btn-sm" @click="editProduct(product.id)">Edit</button>
                                                <button class="btn btn-danger btn-sm" @click="deleteProducts(product.id)">Delete</button>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>

                                <Pagination v-if="isPaginate(products.first_page_url, products.last_page_url)" :links="products.links" :callBack="paginateData" />

                            </div>
                            <div v-else class="empty text-center">
                                <h5>Empty</h5>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-5 order-1 order-md-2">
                    <div class="card">
                        <div class="card-header py-3 bg-gray50">
                            <div class="d-flex align-items-center justify-content-between">
                                <h4 v-if="edit" class="card-title">Update Product</h4>
                                <h4 v-else class="card-title">Add New Product</h4>
                            </div>
                        </div>
                        <div class="card-content p-4">
                            <form v-on="edit ? { submit: updateProduct } : { submit: saveProduct}">
                                <div class="form-group">
                                    <label for="name" class="form-label">Name</label>
                                    <input type="text" v-model="form.name" id="name" class="form-control" placeholder="Type raw material name">
                                    <span v-if="form.errors.has('name')" v-html="form.errors.get('name')" class="text-danger"></span>
                                </div>
                                <div class="my-4">
                                    <label for="materials">Materials</label>
                                    <div v-if="materials && materials.length" class="row mt-2" id="materials">

                                        <div v-for="(material, i) in  materials" class="col-md-4">
                                            <div class="form-check">
                                                <input v-model="form.materials" :value="material.id" class="form-check-input" type="checkbox" value="" :id="'material-'+material.id">
                                                <label class="form-check-label" :for="'material-'+material.id">
                                                    {{ material.name }}
                                                </label>
                                            </div>
                                        </div>

                                    </div>
                                    <div v-else class="empty">
                                        <h5>Material Empty</h5>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <button v-if="edit" type="submit" class="btn btn-primary">Update</button>
                                    <button v-if="edit" @click.prevent="cleanForm" type="button" class="btn btn-primary">Cancel</button>
                                    <button v-else type="submit" class="btn btn-primary">Save</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
                 aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-dialog-centered modal-dialog-scrollable"
                     role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalCenterTitle">Product Materials</h5>
                            <button type="button" class="close" data-bs-dismiss="modal"
                                    aria-label="Close">
                                <i data-feather="x"></i>
                            </button>
                        </div>
                        <div class="modal-body">
                            <ul class="list-group">
                                <li v-for="material in view" class="list-group-item">{{ material.name }}</li>
                            </ul>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary ml-1" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</template>

<script>
import Pagination from "../components/Pagination";
export default {
    name: "productsList",
    components: { Pagination },
    data() {
        return {
            form: new Form({
                name: '',
                materials: []
            }),
            edit: false,
            editId: '',
            materials: {},
            view: {}
        }
    },

    mounted() {
        this.$store.dispatch('products/getProducts');
        this.getRawMaterials();
    },

    methods: {
        paginateData(page) {
            this.$store.dispatch('products/getProducts', page);
        },

        getRawMaterials() {
            axios.get('getRawMaterials')
                .then(res => {
                    if (res.data.success){
                        this.materials = res.data.materials;
                    }
                })
                .catch(err => this.error(err))
        },

        saveProduct(e) {
            e.preventDefault();
            this.form.post('products/save')
                .then(res => {
                    if (res.data.success) {
                        this.$store.commit('products/addNew', res.data.product);
                        this.cleanForm()
                    }
                })
                .catch(err => this.error(err));
        },

        editProduct(id) {
            this.cleanForm();
            let name = this.products.data.filter(product => product.id === id);
            this.form.name = name[0].name;

            if (name[0].materials.length){
                let materials = name[0].materials.map(material => {
                    return material.raw_material_id;
                })
                this.form.materials = materials;
            }else {
                this.form.materials = [];
            }

            this.edit = true;
            this.editId = id;
        },

        updateProduct(e) {
            e.preventDefault();
            this.form.post(`products/update/${this.editId}`)
                .then(res => {
                    if (res.data.success) {
                        this.$store.commit('products/update', res.data.product);
                        this.cleanForm()
                    }
                })
                .catch(err => this.error(err));
        },

        deleteProducts(id) {
            this.confirm(() => {
                axios.post(`products/delete/${id}`)
                    .then(res => {
                        if (res.data.success){
                            this.$store.commit('products/delete', id);
                        }
                    })
                    .catch(err => this.error(err));
            })
        },

        cleanForm() {
            this.form.name = '';
            this.form.materials = [];
            this.edit = false;
            this.editId = '';
        },

        viewProduct(id) {
            axios.get(`products/view/${id}`)
                .then(res => {
                    if (res.data.success){
                        this.view = res.data.productMaterials;
                        let myModal = new bootstrap.Modal(document.getElementById('exampleModalCenter'), {
                            keyboard: false,
                            //backdrop: true
                            //focus: false
                        })
                        myModal.toggle();
                    }
                })
                .catch(err => this.error(err))
        }
    },
}
</script>

<style scoped>

</style>
