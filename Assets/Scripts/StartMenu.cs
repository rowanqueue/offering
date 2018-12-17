using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class StartMenu : MonoBehaviour {
    public TMP_Text scrampText;
    public TMP_Text offeringText;
    public Image enter;
    public BoxCollider bc;
    public float lerpTime;//time it takes to lerp in and out
    public float timeToSelect;
    float actualTime;
    public AudioSource source;
    public AudioSource music;
    bool leaving;
    float duration;
    Color transparent = new Color(1, 1, 1, 0);
    // Use this for initialization
    void Start () {
        actualTime = timeToSelect;
        DontDestroyOnLoad(music);
        scrampText.color = transparent;
        offeringText.color = transparent;
        enter.color = transparent;
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
        //enterText.color = offeringText.color;
        if (duration > lerpTime * 3)
        {
            if(music.isPlaying == false)
            {
                music.Play();
            }
            offeringText.color = Color.Lerp(transparent, Color.white, (duration - lerpTime * 3) / lerpTime);
            music.volume = (duration - lerpTime * 3) / lerpTime;
            enter.color = offeringText.color;
        }
        if(duration > lerpTime * 3.5)
        {
            RaycastHit hit;
            if (leaving == false && Physics.Raycast(Camera.main.ScreenPointToRay(Input.mousePosition), out hit))
            {
                actualTime -= Time.deltaTime;
            }
            else
            {
                actualTime += Time.deltaTime;
                if(actualTime > timeToSelect)
                {
                    actualTime = timeToSelect;
                }
            }
        }
        if (leaving) { enter.fillAmount = 0; } else
        {
            enter.fillAmount = actualTime / timeToSelect;
        }
        if(duration > lerpTime * 4)
        {

            if (leaving == false && actualTime <= 0)
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
