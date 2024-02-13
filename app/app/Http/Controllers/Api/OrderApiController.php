<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Product;
use Illuminate\Http\Request;

class OrderApiController extends Controller
{
    public function index()
    {
        return Order::All();
    }

    public function store(Request $request)
    {
        $OrderItem = Order::create([
            'user_id' => $request->user_id,
            'customerName' => $request->customerName,
            'customerLastName' => $request->customerLastName,
            'customerEmail' => $request->customerEmail,
            'customerAddress' => $request->customerAddress,
            'customerPhone' => $request->customerPhone,
            'comment' => $request->comment,
            'total' => $request->total,
        ]);

        foreach ($request->cartProducts as $product) {
            $Item =
            new OrderItem([
                'product_id' => $product['id'],
                'price' => $product['price'],
                'quantity' => $product['amount'],
                'title' => $product['title'],
                'image' => $product['image'],
                ]);
            $OrderItem->item()->save($Item);
        }
        return response()->json($OrderItem);
    }

    public function show($id)
    {
        $orders = Order::Where('user_id', $id)->get();
        $result = [];
        foreach ($orders as $order) {
            $order->item = $order->item()->get();
            $result[] = $order;
        }

        return response()->json($result);
    }

    public function edit($id)
    {
        //
    }

    public function update(Request $request, $id)
    {
        //
    }

    public function destroy($id)
    {
        //
    }
}
