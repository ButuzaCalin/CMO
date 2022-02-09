package com.example.movieapi;

import androidx.appcompat.app.AppCompatActivity;


import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonArrayRequest;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.Volley;
import com.bumptech.glide.Glide;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class MovieDetails extends AppCompatActivity {

    TextView textName, overview, release, avg, count, collection, hpg;
    String JSONurl;
    ImageView img, img2;
    Button copy;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_movie_details);

        textName = findViewById(R.id.textName);
        img = findViewById(R.id.imageView2);
        img2 = findViewById(R.id.imageView4);
        overview = findViewById(R.id.overviewTxt);
        release = findViewById(R.id.release);
        avg = findViewById(R.id.txtAvg);
        count = findViewById(R.id.txtCount);
        hpg = findViewById(R.id.txt_hpg);
        collection = findViewById(R.id.collection);
        collection.setText("No collection");
        img2.setImageResource(R.drawable.download);

        copy = findViewById(R.id.button);
        copy.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                ClipboardManager clipboardManager = (ClipboardManager) getSystemService(Context.CLIPBOARD_SERVICE);
                ClipData clip = ClipData.newPlainText("LINK", hpg.getText().toString());
                clipboardManager.setPrimaryClip(clip);

                Toast.makeText(MovieDetails.this, "Linkul a fost copiat", Toast.LENGTH_SHORT).show();
            }
        });


        JSONurl = "https://api.themoviedb.org/3/movie/"+getIntent().getStringExtra("data")+"?api_key=2fbd078429afa047f3a93623c7f6aad5";
        System.out.println(JSONurl);

        RequestQueue requestQueue;
        requestQueue = Volley.newRequestQueue(this);
        JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(Request.Method.GET, JSONurl, null, new Response.Listener<JSONObject>() {
            @Override
            public void onResponse(JSONObject response) {

                try {

                    hpg.setText(response.getString("homepage"));
                    textName.setText(response.getString("title"));
                    overview.setText(response.getString("overview"));
                    release.setText(response.getString("release_date"));
                    avg.setText(response.getString("vote_average") + " / 10");
                    count.setText(response.getString("vote_count"));
                    Glide.with(getApplicationContext()).load("https://image.tmdb.org/t/p/w500"+response.
                            getString("poster_path")).into(img);

                    JSONObject a = response.getJSONObject("belongs_to_collection");

                        collection.setText(a.getString("name"));
                        Glide.with(getApplicationContext()).load("https://image.tmdb.org/t/p/w500" + a.
                                getString("poster_path")).into(img2);


                } catch (JSONException e) {
                    e.printStackTrace();
                }

            }
        }
                , new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {

            }
        }
        );
        requestQueue.add(jsonObjectRequest);
    }

}


