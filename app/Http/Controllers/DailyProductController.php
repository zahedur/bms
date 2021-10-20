<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\ProductMaterial;
use App\Models\RawMaterial;
use App\Models\Unit;
use Illuminate\Http\Request;

class DailyProductController extends Controller
{
    public function getReadyProducts() {
        $products = Product::where('status', 1)->get();
        return response()->json(['success' => true, 'products' => $products]);
    }

    public function getProductMaterials(Request $request) {
        $productMaterials = ProductMaterial::where('product_id', $request->id)->get();
        return response()->json(['success' => true, 'productMaterials' => $productMaterials]);
    }

    public function getRawMaterials() {
        $materials = RawMaterial::where('status', 1)->get();
        return response()->json(['success' => true, 'materials' => $materials]);
    }

    public function getUnits() {
        $units = Unit::all();
        return response()->json(['success' => true, 'units' => $units]);
    }
}
