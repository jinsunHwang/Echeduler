package com.mobitant.echeduler;

import android.Manifest;
import android.content.pm.PackageManager;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;

public class MainActivity extends AppCompatActivity {

    WebView webView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        webView=(WebView) findViewById(R.id.webView);

        version();

        WebSettings settings = webView.getSettings();
        webView.setWebViewClient(new WebViewClient());


        settings.setSaveFormData(false);
        settings.setUseWideViewPort(true);
        settings.setJavaScriptEnabled(true);
        settings.setGeolocationEnabled(true);//위치정보 허용
        settings.setSupportZoom(false); // 확대,축소 기능을 사용할 수 있도록 설정
        settings.setCacheMode(WebSettings.LOAD_NO_CACHE); // 웹뷰가 캐시를 사용하지 않도록 설정
        settings.setUseWideViewPort(true); // wide viewport를 사용하도록 설정
        settings.setBuiltInZoomControls(false);
        settings.setSupportZoom(true);
        settings.setLoadWithOverviewMode(true);
        settings.setUseWideViewPort(true);
        settings.setDatabaseEnabled(true);
        settings.setDomStorageEnabled(true);
        settings.setAppCacheEnabled(true);
        settings.setDatabaseEnabled(true);

        webView.loadUrl("http://115.86.114.26:8080/cal/main");
    }

    public void version() {
        // 권한 받기
        if (ContextCompat.checkSelfPermission(getApplicationContext(),
                Manifest.permission.INTERNET)
                != PackageManager.PERMISSION_GRANTED) {

            // Should we show an explanation?
            if (ActivityCompat.shouldShowRequestPermissionRationale(this,
                    android.Manifest.permission.INTERNET)) {

                //--차단하지 않는 것은 사용자 *asynchronously*에 대한 expanation 보여 주세요 //.
                //이 사용자의 반응을 기다리고 있은 스레드로부터! 는 사용자 후에
                //그 설명을 다시 권한을 요청할 노력을 본다.

            } else {

                //설명이 필요하지 않으므로 사용 권한을 요청할 수 있습니다.

                ActivityCompat.requestPermissions(this,
                        new String[]{android.Manifest.permission.INTERNET},
                        1);

                // MY_PERMISSIONS_REQUEST_READ_CONTACTS isaa an
                // int 상수를 유지합니다. 콜백 방법은 다음과 같습니다.
                //요청의 결과.
            }
        }
    }
}