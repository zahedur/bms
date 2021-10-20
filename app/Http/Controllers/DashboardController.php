<?php

namespace App\Http\Controllers;

use App\Models\RawMaterial;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index() {
        $totalRawMaterial = RawMaterial::all()->count();
        $dashboardData = [
            'totalRawMaterial' => $totalRawMaterial
        ];
        return response()->json(['success' => true, 'dashboardData' => $dashboardData]);
    }
}
