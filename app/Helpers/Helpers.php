<?php

use Illuminate\Support\Facades\DB;

function resError($message, $status) {
    return response()->json(['success' => false, 'message' => $message], $status);
}

function getNameByID($model, $id, $name) {
    $getName = DB::table($model)->find($id);
    if ($getName){
        return $getName->$name;
    }else{
        return '';
    }
}
