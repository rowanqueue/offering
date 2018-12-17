﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.SceneManagement;

public class StartMenu : MonoBehaviour {
    public TMP_Text scrampText;
    public TMP_Text offeringText;
    public float lerpTime;//time it takes to lerp in and out
    public AudioSource source;
    public AudioSource music;
    bool leaving;
    float duration;
    Color transparent = new Color(1, 1, 1, 0);
    // Use this for initialization
    void Start () {
        DontDestroyOnLoad(music);
	}
	
	// Update is called once per frame
	void Update () {
        duration += Time.deltaTime;
        if(duration < lerpTime)
        {
            scrampText.color = Color.Lerp(transparent, Color.white, duration / lerpTime);
            if(duration >= lerpTime*0.25f && source.isPlaying == false)
            {
                source.Play();
            }
        }else if(duration > lerpTime * 2)
        {
            scrampText.color = Color.Lerp(Color.white, transparent, (duration - lerpTime * 2) / lerpTime);
            source.volume = 1 - (duration - lerpTime * 2) / lerpTime;
            /*source.volume = 1 - (duration - lerpTime * 2) / lerpTime;
            if (source.volume < 0.2f)
            {
                source.volume = 0.2f;
            }*/
        }

        if(duration > lerpTime * 3)
        {
            if(music.isPlaying == false)
            {
                music.Play();
            }
            offeringText.color = Color.Lerp(transparent, Color.white, (duration - lerpTime * 3) / lerpTime);
            music.volume = (duration - lerpTime * 3) / lerpTime;
        }
        if(duration > lerpTime * 4)
        {
            if (leaving == false && Input.anyKeyDown)
            {
                leaving = true;
                duration = lerpTime * 4;
                //SceneManager.LoadScene(1);
            }
            if (leaving)
            {
                offeringText.color = Color.Lerp(Color.white, transparent, (duration - lerpTime * 4) / lerpTime);
                if(duration > lerpTime * 5)
                {
                    SceneManager.LoadScene(1);
                }
            }
        }
	}
}
