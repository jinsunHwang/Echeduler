package com.mobitant.echeduler;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.PersistableBundle;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.ProgressBar;

public class IndexActivity extends AppCompatActivity {

    ProgressBar pbLoading;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_index);

        pbLoading = (ProgressBar) findViewById(R.id.progressBar1);

        loadThread.start();


    }

    @Override
    protected void onPause() {
        // TODO Auto-generated method stub
        super.onPause();
        pbLoading.setVisibility(View.GONE); // onPause 를 이용하여 엑티비티를 숨기기.
    }

    Thread loadThread = new Thread(){
        @Override
        public void run() {
            super.run();

            try {
                sleep(3000);
                Intent intent = new Intent(getApplicationContext(),MainActivity.class);

                startActivity(intent);
                System.exit(0);
            }catch (InterruptedException e){
                e.printStackTrace();
            }


        }
    };


}
