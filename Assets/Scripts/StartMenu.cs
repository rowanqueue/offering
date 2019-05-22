using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class StartMenu : MonoBehaviour {
    public bool demo;
    public bool hasSave;
    public TMP_Text scrampText;
    public TMP_Text offeringText;
    public Collider enterNo;
    public Collider enterWith;
    public Collider continueWith;
    public float holdTime;
    float actualTimeEnter;
    float actualTimeContinue;
    public float lerpTime;//time it takes to lerp in and out
    public AudioSource source;
    public AudioSource music;

    public Image sneakPeek;
    public List<Sprite> actImages;
    public int act;
    public CheatStarter cs;

    bool leaving;
    float duration;
    Color transparent = new Color(1, 1, 1, 0);
    Image enter;
    Image continueButton;
    // Use this for initialization
    void Start () {
        actualTimeEnter = holdTime;
        actualTimeContinue = holdTime;
        DontDestroyOnLoad(music);
        //check for saves
        string checkPoint = PlayerPrefs.GetString("save").ToLower();
        Debug.Log(checkPoint);
        if(checkPoint != null && checkPoint != "")
        {
            hasSave = true;
        }
        else
        {
            hasSave = false;
        }
        if (demo) { hasSave = false; }
        if (!hasSave)
        {
            enter = enterNo.GetComponent<Image>();
        }
        else
        {
            enter = enterWith.GetComponent<Image>();
            //playerprefs sets act here
            act = new List<string>() {"act0","act1","act2","act3","act4","act5","act6" }.IndexOf(checkPoint);
            sneakPeek.sprite = actImages[act - 1];

        }
        enter.transform.parent.gameObject.SetActive(true);
        continueButton = continueWith.GetComponent<Image>();
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
        if(leaving == false && duration > lerpTime * 3.5f)
        {
            RaycastHit hit;
            if (Physics.Raycast(Camera.main.ScreenPointToRay(Input.mousePosition), out hit))
            {
                if(hit.collider.name == "Start")
                {
                    actualTimeEnter -= Time.deltaTime;
                }
                else
                {
                    actualTimeEnter += Time.deltaTime;
                    if (actualTimeEnter > holdTime)
                    {
                        actualTimeEnter = holdTime;
                    }
                }
                if(hit.collider.name == "Continue")
                {
                    actualTimeContinue -= Time.deltaTime;
                }
                else
                {
                    actualTimeContinue += Time.deltaTime;
                    if (actualTimeContinue > holdTime)
                    {
                        actualTimeContinue = holdTime;
                    }
                }

            }
            else
            {
                actualTimeEnter += Time.deltaTime;
                if(actualTimeEnter > holdTime)
                {
                    actualTimeEnter = holdTime;
                }
                actualTimeContinue += Time.deltaTime;
                if (actualTimeContinue > holdTime)
                {
                    actualTimeContinue = holdTime;
                }
            }
        }
        enter.fillAmount = actualTimeEnter/holdTime;
        if(actualTimeEnter < 0)
        {
            enter.fillAmount = 0;
        }
        if(actualTimeContinue < 0)
        {
            continueButton.fillAmount = 0;
        }
        if(duration > lerpTime * 4)
        {
            if (leaving == false)
            {
                if(actualTimeEnter < 0 || actualTimeContinue < 0)
                {
                    leaving = true;
                    duration = lerpTime * 4;
                }
            }
            if (leaving)
            {
                offeringText.color = Color.Lerp(Color.white, transparent, (duration - lerpTime * 4) / lerpTime);
                if(duration > lerpTime * 5)
                {
                    if(actualTimeEnter < 0)
                    {
                        SceneManager.LoadScene(1);
                    }
                    if(actualTimeContinue < 0)
                    {
                        cs.act = act;
                        music.Stop();
                        SceneManager.LoadScene(2);
                    }
                }
            }
        }
        enter.color = offeringText.color;
        if (hasSave)
        {
            continueButton.fillAmount = actualTimeContinue / holdTime;
            continueButton.color = offeringText.color;
            sneakPeek.transform.parent.GetComponent<Image>().color = offeringText.color;
            sneakPeek.color = offeringText.color;
        }
    }
}
