<template>
    <div>
        <div class="page-heading">
            <div class="page-title">
                <div class="row">
                    <div class="col-12 col-md-6 order-md-1 order-last">
                        <h3>Daily Products List</h3>
                    </div>
                    <div class="col-12 col-md-6 order-md-2 order-first">
                        <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><router-link :to="{ name: 'dashboard' }">Dashboard</router-link></li>
                                <li class="breadcrumb-item active" aria-current="page">Daily Products List</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <div class="page-content">
            <div class="row">
                <div class="col-md-12 order-2 order-md-1">
                    <div class="card">
                        <div class="card-header py-3 bg-gray50">
                            <div class="d-flex align-items-center justify-content-between">
                                <h4 class="card-title">Daily Products List</h4>
                                <router-link :to="{ name: 'addDailyProduct'}" class="btn btn-primary">Add New</router-link>
                            </div>
                        </div>
                        <div class="card-content p-4">
                            <div>
                                <div class="table-responsive">
                                    <table class="table table-bordered mb-0">
                                        <thead>
                                        <tr>
                                            <th class="text-center">#</th>
                                            <th>Name</th>
                                            <th class="text-center">Material</th>
                                            <th class="text-center">Total Amount</th>
                                            <th class="text-center">ACTION</th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        <tr>
                                            <td class="text-center">0</td>
                                            <td>0</td>
                                            <td class="text-center">0</td>
                                            <td class="text-center">0</td>
                                            <td class="text-center">
                                                <button class="btn btn-info btn-sm">View</button>
                                                <button class="btn btn-success btn-sm">Edit</button>
                                                <button class="btn btn-danger btn-sm">Delete</button>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>

<!--                                <Pagination v-if="isPaginate(products.first_page_url, products.last_page_url)" :links="products.links" :callBack="paginateData" />-->

                            </div>
<!--                            <div v-else class="empty text-center">-->
<!--                                <h5>Empty</h5>-->
<!--                            </div>-->
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</template>

<script>
export default {
    name: "dailyProducts",
}
</script>

<style scoped>

</style>
