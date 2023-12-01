package com.learningApp.learning_anglish_app
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
// Screenshot
import android.view.WindowManager.LayoutParams

class MainActivity: FlutterActivity() {
                    override fun onCreate(savedInstanceState: Bundle?) {
                                        super.onCreate(savedInstanceState)
                                        getWindow().addFlags(LayoutParams.FLAG_SECURE);
        //stackLockTask()
                    } 
    /* 
                    @Override
                    public void onCreate(Bundle savedInstanceState) {
                                       
                                        super.onCreate(savedInstanceState);
                    }
                    */
}
