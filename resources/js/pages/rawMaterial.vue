<template>
    <div>
        <div class="page-heading">
            <div class="page-title">
                <div class="row">
                    <div class="col-12 col-md-6 order-md-1 order-last">
                        <h3>Raw Materials</h3>
                    </div>
                    <div class="col-12 col-md-6 order-md-2 order-first">
                        <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><router-link :to="{ name: 'dashboard' }">Dashboard</router-link></li>
                                <li class="breadcrumb-item active" aria-current="page">Raw Materials</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <div class="page-content">
            <div class="row" id="table-bordered">
                    <div class="col-md-7 order-2 order-md-1">
                        <div class="card">
                            <div class="card-header py-3 bg-gray50">
                                <div class="d-flex align-items-center justify-content-between">
                                    <h4 class="card-title">Raw Materials List</h4>
                                </div>
                            </div>
                            <div class="card-content p-4">
                                <div v-if="rawMaterials.data && rawMaterials.data.length" >
                                    <div class="table-responsive">
                                        <table class="table table-bordered mb-0">
                                            <thead>
                                            <tr>
                                                <th class="text-center">#</th>
                                                <th>Name</th>
                                                <th class="text-center">ACTION</th>
                                            </tr>
                                            </thead>
                                            <tbody>

                                                <tr v-for="(rawMaterial, i) in rawMaterials.data">
                                                    <td class="text-center">{{ i+rawMaterials.from }}</td>
                                                    <td>{{ rawMaterial.name }}</td>
                                                    <td class="text-center">
                                                        <button class="btn btn-success btn-sm" @click="editRawMaterial(rawMaterial.id)">Edit</button>
                                                        <button class="btn btn-danger btn-sm" @click="deleteRawMaterial(rawMaterial.id)">Delete</button>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                    <Pagination v-if="isPaginate(rawMaterials.first_page_url, rawMaterials.last_page_url)" :links="rawMaterials.links" :callBack="paginateData" />

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
                                    <h4 v-if="edit" class="card-title">Update Raw Material</h4>
                                    <h4 v-else class="card-title">Add New Raw Material</h4>
                                </div>
                            </div>
                            <div class="card-content p-4">
                                <form v-on="edit ? { submit: updateRawMaterial } : { submit: saveRawMaterial}">
                                    <div class="form-group">
                                        <label for="name" class="form-label">Name</label>
                                        <input type="text" v-model="form.name" id="name" class="form-control" placeholder="Type raw material name">
                                        <span v-if="form.errors.has('name')" v-html="form.errors.get('name')" class="text-danger"></span>
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
        </div>
    </div>
</template>

<script>
import Pagination from "../components/Pagination";
export default {
    name: "raw-material",
    components: { Pagination },
    data() {
        return {
            form: new Form({
                name: ''
            }),
            edit: false,
            editId: '',
        }
    },

    mounted() {
        this.$store.dispatch('rawMaterials/getRawMaterials');
    },

    methods: {
        paginateData(page) {
            this.$store.dispatch('rawMaterials/getRawMaterials', page);
        },

        saveRawMaterial(e) {
            e.preventDefault();
            this.form.post('rawMaterials/save')
                .then(res => {
                    if (res.data.success) {
                        this.$store.commit('rawMaterials/addNew', res.data.rawMaterial);
                        this.cleanForm()
                    }
                })
                .catch(err => this.error(err));
        },

        editRawMaterial(id) {
            let name = this.rawMaterials.data.filter(rawMaterial => rawMaterial.id === id);
            this.form.name = name[0].name;
            this.edit = true;
            this.editId = id;
        },

        updateRawMaterial(e) {
            e.preventDefault();
            this.form.post(`rawMaterials/update/${this.editId}`)
                .then(res => {
                    if (res.data.success) {
                        this.$store.commit('rawMaterials/update', res.data.rawMaterial);
                        this.cleanForm()
                    }
                })
                .catch(err => this.error(err));
        },

        deleteRawMaterial(id) {
            this.confirm(() => {
                axios.post(`rawMaterials/delete/${id}`)
                    .then(res => {
                        if (res.data.success){
                            this.$store.commit('rawMaterials/delete', id);
                        }
                    })
                    .catch(err => this.error(err));
            })
        },

        cleanForm() {
            this.form.name = '';
            this.edit = false;
            this.editId = '';
        }
    },

}
</script>

<style scoped>

</style>
