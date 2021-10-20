<template>
    <div>
        <div class="page-heading">
            <div class="page-title">
                <div class="row">
                    <div class="col-12 col-md-6 order-md-1 order-last">
                        <h3>Add Daily Product</h3>
                    </div>
                    <div class="col-12 col-md-6 order-md-2 order-first">
                        <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><router-link :to="{ name: 'dashboard' }">Dashboard</router-link></li>
                                <li class="breadcrumb-item"><router-link :to="{ name: 'dailyProducts' }">Daily Products List</router-link></li>
                                <li class="breadcrumb-item active" aria-current="page">Add Daily Product</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <div class="page-content">
            <div class="row">
                <div class="col-md-9 order-2 order-md-1">
                    <div class="card">
                        <div class="card-header py-3 bg-gray50">
                            <div class="d-flex align-items-center justify-content-between">
                                <h4 class="card-title">Add Daily Product</h4>
                                <router-link :to="{ name: 'dailyProducts' }" class="btn btn-primary">Daily Products List</router-link>
                            </div>
                        </div>
                        <div class="card-content p-4">

                            <div class="row py-5">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="productName" class="form-label">Name</label>
                                        <input v-model="form.productName" type="text" id="productName" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="date" class="form-label">Date</label>
                                        <datepicker v-model="form.date" :input-class="'form-control'" id="date" :format="customFormatter"></datepicker>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="selectReadyProduct" class="form-label">Select Ready Product</label>
                                        <select id="selectReadyProduct" class="form-select" @change="onChangeReadyProduct" v-model="readyProduct">
                                            <option value="">--Select Ready product--</option>
                                            <option v-if="readyProducts && readyProducts.length" v-for="(product, i) in readyProducts" :value="product.id">{{ product.name }}</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="table-responsive ">
                                <p>Materials</p>
                                <table class="table table-bordered mb-0 bg-light">
                                    <thead>
                                    <tr>
                                        <th class="text-center">#</th>
                                        <th>Name</th>
                                        <th class="text-center">Unit & Quantity</th>
                                        <th class="text-center">Unit Price</th>
                                        <th class="text-end">Total</th>
                                        <th class="text-center" style="width:20px"><i class="bi bi-x"></i></th>
                                    </tr>
                                    </thead>
                                    <tbody id="product">

                                    <tr v-for="(selectedMaterial, i) in selectedMaterials" :id="'material-'+selectedMaterial" :key="selectedMaterial">
                                        <td class="text-center">{{ i+1 }}</td>
                                        <td>{{ getMaterialName(selectedMaterial) }}</td>
                                        <td>
                                            <div class="d-flex justify-content-center">
                                                <input @keyup="calculateRow(selectedMaterial)" @change="calculateRow(selectedMaterial)" :name="'quantity-'+selectedMaterial" type="number" min="0" value="0" class="form-control w100px">
                                                <select class="form-select w-25" :name="'unit-'+selectedMaterial" @change="calculateRow(selectedMaterial)">
                                                    <option v-for="(unit, i) in units" :value="unit.id" :key="unit.id">{{ unit.symbol }}</option>
                                                </select>
                                            </div>
                                        </td>
                                        <td class="text-center">
                                            <input @keyup="calculateRow(selectedMaterial)" @change="calculateRow(selectedMaterial)" :name="'price-'+selectedMaterial" type="number" min="0" value="0" class="form-control mx-auto w100px">
                                            <small class="d-none priceInfoText bg-warning px-2"></small>
                                        </td>
                                        <td class="text-end position-relative">
                                            <input type="hidden" :id="'totalInput-'+selectedMaterial" class="totalInput" value="0">
                                            <span :id="'total-'+selectedMaterial">0</span>
                                        </td>
                                        <td class="text-center" style="width:20px">
                                            <div class="cursor-pointer text-danger" @click="removeMaterial(selectedMaterial)">
                                                <i class="bi bi-x"></i>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-end font-bold" colspan="4">SUBTOTAL</td>
                                        <td class="text-end" id="subtotal">{{ subtotal }}</td>
                                        <td class="text-center"></td>
                                    </tr>


                                    </tbody>
                                </table>
                            </div>

                            <div class="submit text-end mt-5">
                                <button @click="generateFinalObject" type="button" class="btn btn-primary">Save</button>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-md-3 order-2 order-md-1">
                    <div class="card">
                        <div class="card-header py-3 bg-gray50">
                            <div class="d-flex align-items-center justify-content-between">
                                <h4 class="card-title">Select Material</h4>
                            </div>
                        </div>
                        <div class="card-content p-4">
                            <div v-if="materials && materials.length">
                                <div v-for="(material, i) in materials" class="form-check" :key="i">
                                    <input class="form-check-input" type="checkbox" @change="selectMaterial" v-model="selectedMaterials" :value="material.id" :id="'material-'+material.id">
                                    <label class="form-check-label" :for="'material-'+material.id">
                                        {{ material.name }}
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</template>

<script>
import Datepicker from 'vuejs-datepicker';
export default {
    name: "addDailyProduct",
    components: { Datepicker },
    data() {
        return {
            todayDate: '',
            form: new Form({
                productName: '',
                date: '',
                materials: []
            }),
            readyProducts: {},
            readyProduct: '',
            units: {},
            materials: {},
            selectedMaterials: [],

            quantity: [],
            price: [],
            subtotal: 0,

            selectedMaterialsWithValue: [],
        }
    },

    mounted() {
        this.getReadyProducts();
        this.getRawMaterials();
        this.getUnits();
        this.form.date = this.today();
    },

    methods: {
        //get data from server
        getReadyProducts() {
            axios.get('getReadyProducts')
                .then(res => {
                    if (res.data.success) {
                        this.readyProducts = res.data.products;
                    }
                })
                .catch(err => this.error(err))
        },

        getRawMaterials() {
            axios.get('getRawMaterials')
                .then(res => {
                    if (res.data.success) {
                        this.materials = res.data.materials;
                    }
                })
                .catch(err => this.error(err))
        },

        getUnits() {
            axios.get('getUnits')
                .then(res => {
                    if (res.data.success) {
                        this.units = res.data.units;
                    }
                })
                .catch(err => this.error(err))
        },

        //frontend logic
        onChangeReadyProduct() {
            if (this.readyProduct){
                this.form.productName = this.readyProducts.filter(p => p.id === this.readyProduct)[0].name;

                axios.post('getProductMaterials', {id: this.readyProduct})
                    .then(res => {
                        if (res.data.success) {
                            let materialId = [];
                            res.data.productMaterials.map(m => {
                                materialId.push(m.raw_material_id);
                            })
                            this.selectedMaterials = materialId;
                        }
                    })
                    .catch(err => this.error(err))
            }else {
                this.selectedMaterials = [];
                this.form.productName = '';
            }

        },

        selectMaterial() {
            this.selectedMaterials.map(m => {
                //m.value = 'kk'
                //this.selectedMaterialsWithValue.push(m)
            })

            setTimeout(() => {
                this.calculateSubtotal()
            }, 300)
        },

        calculateRow(id) {
            let quantity = $(`#material-${id} input[name=quantity-${id}]`).val();
            let unit = $(`#material-${id} select[name=unit-${id}]`).val();
            let price = $(`#material-${id} input[name=price-${id}]`).val();

            let unitSymbol = this.units.filter(u => u.id === Number(unit));

            let priceInfoText = $(`#material-${id} .priceInfoText`);
            priceInfoText.addClass('d-none');

            let result = 0;
            if (unitSymbol[0].symbol === 'mg'){
                let mg = quantity / 1000;
                result = mg * price;
                priceInfoText.removeClass('d-none').text('Please input 1kg price');
            }
            else if (unitSymbol[0].symbol === 'mL'){
                let mL = quantity / 1000;
                result = mL * price;
                priceInfoText.removeClass('d-none').text('Please input 1 Litre price');
            }
            else {
                result = quantity * price;
            }

            let rowResult = this.limitAfterDecimal(result, 2);

            $('#total-'+id).text(rowResult);
            $('#totalInput-'+id).val(rowResult);


            this.calculateSubtotal()
        },

        calculateSubtotal() {
            let total = 0;
            $('#product .totalInput').each(function () {
                let value = Number($(this).val());
                total += value;
            })
            this.subtotal = this.limitAfterDecimal(total, 2);
        },

        removeMaterial(id) {
            this.selectedMaterials = this.selectedMaterials.filter(m => m !== id);
            setTimeout(() => {
                this.calculateSubtotal()
            }, 300)
        },

        getMaterialName(id) {
            let material = this.materials.filter(material => material.id === id);
            if (material){
                return material[0].name;
            }else{
                return ''
            }
        },

        generateFinalObject() {

            let singleMaterialWithData = []
            this.selectedMaterials.map(m => {
                let quantity = $(`#material-${m} input[name=quantity-${m}]`).val();
                let unit = $(`#material-${m} select[name=unit-${m}]`).val();
                let price = $(`#material-${m} input[name=price-${m}]`).val();
                let total = $(`#totalInput-${m}`).val();
                let singleMaterial = {
                    m,
                    unit,
                    quantity,
                    price,
                    total
                }
                singleMaterialWithData.push(singleMaterial)

            })
            //console.log(singleMaterialWithData)
            this.selectedMaterialsWithValue = singleMaterialWithData
        }
    }
}
</script>

<style scoped>
    .priceInfoText {
       font-size: 12px;
    }

</style>
