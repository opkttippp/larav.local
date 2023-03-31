<?php

use App\Models\User;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {

    public function up()
    {
        Schema::create('messages', function (Blueprint $table) {
            $table->id();
            $table->text('massage');
            $table->timestamps();
            $table->foreignIdFor(User::class)
                ->constrained()
                ->cascadeOnDelete();
        });
    }

    public function down()
    {
        Schema::dropIfExists('messages');
    }
};
