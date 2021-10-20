<?php

namespace App\Http\Controllers;

use App\Models\RawMaterial;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class RawMaterialController extends Controller
{
    public function index() {
        $rawMaterials = RawMaterial::paginate(30);
        return response()->json(['success' => true, 'rawMaterials' => $rawMaterials]);
    }

    public function save(Request $request) {
        $request->validate([
            'name' => 'required|string|max:50'
        ]);

        DB::beginTransaction();
        try {
            $rawMaterial = new RawMaterial();
            $rawMaterial->name = $request->name;
            $rawMaterial->save();
            Db::commit();
            return response()->json(['success' => true, 'rawMaterial' => $rawMaterial, 'message' => 'Raw material has been saved successfully!'], 201);
        }catch (\Exception $e){
            DB::rollBack();
            return resError($e->getMessage(), 417);
        }
    }

    public function update(Request $request, $id) {
        $request->validate([
            'name' => 'required|string|max:50'
        ]);

        DB::beginTransaction();
        try {
            $rawMaterial = RawMaterial::find($id);
            $rawMaterial->name = $request->name;
            $rawMaterial->save();
            Db::commit();
            return response()->json(['success' => true, 'rawMaterial' => $rawMaterial, 'message' => 'Raw material has been updated successfully!'], 201);
        }catch (\Exception $e){
            DB::rollBack();
            return resError($e->getMessage(), 417);
        }
    }

    public function delete($id) {
        DB::beginTransaction();
        try {
            $rawMaterial = RawMaterial::find($id);
            $rawMaterial->delete();
            Db::commit();
            return response()->json(['success' => true, 'message' => 'Raw material has been deleted successfully!']);
        }catch (\Exception $e){
            DB::rollBack();
            return resError($e->getMessage(), 417);
        }
    }
}
