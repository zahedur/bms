<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\ProductMaterial;
use App\Models\RawMaterial;
use App\Models\Unit;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ProductCotroller extends Controller
{
    public function index() {
        $products = Product::with('materials')->paginate(30);
        foreach ($products as $product) {
            $product->totalMaterial = ProductMaterial::where('product_id', $product->id)->count();
        }
        return response()->json(['success' => true, 'products' => $products]);
    }

    public function save(Request $request) {
        $request->validate([
            'name'      => 'required|string|max:50',
            'materials'  =>  'required'
        ]);

        DB::beginTransaction();
        try {
            $product = new Product();
            $product->name = $request->name;
            $product->save();

            $materials = $request->materials;
            for($i = 0; $i < count($materials); $i++) {
                $productMaterial = new ProductMaterial();
                $productMaterial->product_id = $product->id;
                $productMaterial->raw_material_id = $materials[$i];
                $productMaterial->save();
            }

            Db::commit();
            $product->materials = $product->materials;
            $product->totalMaterial = ProductMaterial::where('product_id', $product->id)->count();
            return response()->json(['success' => true, 'product' => $product, 'message' => 'Product has been saved successfully!'], 201);
        }catch (\Exception $e){
            DB::rollBack();
            return resError($e->getMessage(), 417);
        }
    }

    public function update(Request $request, $id) {
        $request->validate([
            'name'      => 'required|string|max:50',
            'materials'  =>  'required'
        ]);

        DB::beginTransaction();
        try {
            $product = Product::find($id);
            $product->name = $request->name;
            $product->save();

            $oldMaterials = ProductMaterial::where('product_id', $id);
            $oldMaterials->delete();
            $materials = $request->materials;
            for($i = 0; $i < count($materials); $i++) {
                $productMaterial = new ProductMaterial();
                $productMaterial->product_id = $product->id;
                $productMaterial->raw_material_id = $materials[$i];
                $productMaterial->save();
            }

            Db::commit();
            $product->materials = $product->materials;
            $product->totalMaterial = ProductMaterial::where('product_id', $product->id)->count();
            return response()->json(['success' => true, 'product' => $product, 'message' => 'Product has been updated successfully!'], 201);
        }catch (\Exception $e) {
            DB::rollBack();
            return resError($e->getMessage(), 417);
        }
    }

    public function delete($id) {
        DB::beginTransaction();
        try {
            $product = Product::find($id);
            $product->delete();
            Db::commit();
            return response()->json(['success' => true, 'message' => 'Product has been deleted successfully!']);
        }catch (\Exception $e){
            DB::rollBack();
            return resError($e->getMessage(), 417);
        }
    }

    public function getRawMaterials() {
        $materials = RawMaterial::where('status', 1)->get();
        return response()->json(['success' => true, 'materials' => $materials]);
    }

    public function getUnits() {
        $units = Unit::all();
        return response()->json(['success' => true, 'units' => $units]);
    }

    public function view($id) {
        $productMaterials = ProductMaterial::where('product_id', $id)->get();
        foreach ($productMaterials as $productMaterial) {
            $productMaterial->name = getNameByID('raw_materials', $productMaterial->raw_material_id, 'name');
        }
        return response()->json(['success' => true, 'productMaterials' => $productMaterials]);
    }
}
