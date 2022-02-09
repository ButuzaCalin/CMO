package com.example.movieapi;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.AsyncTask;
import android.os.Bundle;
import android.renderscript.ScriptGroup;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.Switch;

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
import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {

    private static String JSON_URL = "https://api.themoviedb.org/3/movie/top_rated?api_key=2fbd078429afa047f3a93623c7f6aad5";

    List<MovieModelClass> movieList;
    RecyclerView recyclerView;
    ImageView header;
    Button popular, topRrated, upcoming;
    ProgressBar pb;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);


        movieList = new ArrayList<>();
        recyclerView = (RecyclerView) findViewById(R.id.recView);

        header = findViewById(R.id.imageView3);
        pb = findViewById(R.id.progressBar);
        pb.setVisibility(View.INVISIBLE);

        Glide.with(this).load(R.drawable.dunkirk_2017_movie_4k)
        .into(header);
        GetData getData = new GetData();
        getData.execute();


        popular = findViewById(R.id.bt_pp);
        topRrated = findViewById(R.id.bt_tr);
        upcoming = findViewById(R.id.bt_up);

        popular.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                JSON_URL = "https://api.themoviedb.org/3/movie/popular?api_key=2fbd078429afa047f3a93623c7f6aad5";
                movieList.clear();
                GetData getDataPp = new GetData();
                getDataPp.execute();
            }
        });

        topRrated.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                JSON_URL = "https://api.themoviedb.org/3/movie/top_rated?api_key=2fbd078429afa047f3a93623c7f6aad5";
                movieList.clear();
                GetData getDataPp = new GetData();
                getDataPp.execute();
            }
        });

        upcoming.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                JSON_URL = "https://api.themoviedb.org/3/movie/upcoming?api_key=2fbd078429afa047f3a93623c7f6aad5";
                movieList.clear();
                GetData getDataPp = new GetData();
                getDataPp.execute();
            }
        });

    }

    public class GetData extends AsyncTask<String, String, String>{

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            pb.setVisibility(View.VISIBLE);
        }

        @Override
        protected String doInBackground(String... strings) {
          String current = "";

          try {
                URL url;
                HttpURLConnection urlConnection = null;

                try{
                    url = new URL(JSON_URL);
                    urlConnection  = (HttpURLConnection) url.openConnection();

                    InputStream is = urlConnection.getInputStream();
                    InputStreamReader isr = new InputStreamReader(is);


                    int data = isr.read();
                    while (data != -1){

                        current+=(char)data;
                        data = isr.read();
                    }


                    return current;

                } catch (MalformedURLException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }finally {
                    if(urlConnection != null){
                        urlConnection.disconnect();
                    }
                }


          } catch (Exception e) {
              e.printStackTrace();
          }
            return current;
        }

        @Override
        protected void onPostExecute(String s) {
            try{
                JSONObject jsonObject = new JSONObject(s);
                JSONArray jsonArray = jsonObject.getJSONArray("results");
                pb.setVisibility(View.INVISIBLE);

                for(int i=0; i< jsonArray.length(); i++){

                    JSONObject jsonObject1 = jsonArray.getJSONObject(i);
                   MovieModelClass model = new MovieModelClass();
                   model.setId(jsonObject1.getString("vote_average"));
                   model.setName(jsonObject1.getString("title"));
                   model.setImg(jsonObject1.getString("poster_path"));
                   model.setIdentificare(jsonObject1.getString("id"));
                   movieList.add(model);

                  //System.out.println(jsonObject1.getString("title"));

                  // System.out.println(jsonObject1.getString("id"));


                }

            } catch (JSONException e) {
                e.printStackTrace();
            }

            PutDataIntoRecycleView(movieList);
        }
    }

    private void PutDataIntoRecycleView(List<MovieModelClass> movieList){

        Adaptery adaptery = new Adaptery(this, movieList);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        recyclerView.setAdapter(adaptery);

    }


}