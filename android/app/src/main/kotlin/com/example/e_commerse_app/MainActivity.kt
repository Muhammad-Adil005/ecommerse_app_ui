package com.example.e_commerse_app

import io.flutter.embedding.android.FlutterActivity
import android.os.Bundle
import android.content.Context
import android.content.Intent
import android.widget.Toast

class MainActivity : FlutterActivity() {

    // If you need to override onCreate, you can add it like this
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // Your code here
    }

    // Example function that might use Context and Toast
    fun showToast(context: Context) {
        Toast.makeText(context, "Hello from MainActivity", Toast.LENGTH_SHORT).show()
    }
}
