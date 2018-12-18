using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using TMPro;

public class Credits : MonoBehaviour {
    public TMP_Text displayText;
    public float lerpTime;//time it takes to lerp in and out
    public float stayTime;//time text stays up
    public int state;//0lerpingin,1staying,1lerpingout
    public string[] textToDisplay;
    float duration;
    float durationVolume;
    int index;
    AudioSource destroyThis;
	// Use this for initialization
	void Start () {
        destroyThis = GameObject.FindGameObjectWithTag("DestroyThis").GetComponent<AudioSource>();
        textToDisplay = new string[] {
            "<b>Lead Artist</b><size=35>\nAjali Harrison</size>\n\n<b>Additional Art</b><size=35>\nMcKenna Flanagan</size>",
            "<b>Lead Sound Designer</b><size=35>\nChristian Weinschenk</size>",
            "<b>Music</b><size=35>\nChristian Weinschenk & Spencer Bernstein</size>",
            "<b>Lead Puzzle Designer</b><size=35>\nParker Crandell</size>\n\n<b>Additional Puzzle Design</b>\n<size=35>Spencer Bernstein, Rowan Q</size>",
            "<b>Lead Programmer</b><size=35>\nRowan Q</size>\n\n<b>Additional Programming</b><size=35>\nParker Crandell</size>",
            "<b>Lead Writer</b><size=35>\nSpencer Bernstein</size>\n\n<b>Additional Writing</b><size=35>\nParker Crandell, McKenna Flanagan, Ajali Harrison, Rowan Q</size>",
            "<b>Special thanks to</b><size=35>\nNaomi, Isabella, Jason, Jeremiah, and Mom</size>"
 };
        displayText.text = textToDisplay[index];
	}
	
	// Update is called once per frame
	void Update () {
        float mod = 1.0f;
        if (Input.anyKey)
        {
            mod = 5.0f;
        }
        duration += Time.deltaTime*mod;
        if(index >= textToDisplay.Length - 1)
        {
            durationVolume += Time.deltaTime * mod;
            destroyThis.volume = Mathf.Lerp(1, 0.15f, durationVolume/(stayTime + lerpTime*2));
        }
        if (state == 0)//lerping in!
        {
            displayText.color = Color.Lerp(Color.black, Color.white, duration/lerpTime);
            if(duration > lerpTime)
            {
                state = 1;
            }
        }
        if(state == 1)//staying!!
        {
            if(duration > lerpTime + stayTime)
            {
                state = 2;
            }
        }
        if(state == 2)//lerping out
        {
            displayText.color = Color.Lerp(Color.white, Color.black, (duration - lerpTime - stayTime) / lerpTime);
            if(duration > lerpTime*2 + stayTime)
            {
                index++;
                if(index < textToDisplay.Length)
                {
                    state = 0;
                    duration = 0;
                    displayText.text = textToDisplay[index];
                }
                else
                {
                    index--;

                    //THIS IS WHERE WE THEN GO INTO THE REAL GAME
                    if(destroyThis != null)
                    {
                        //Destroy(destroyThis);
                        SceneManager.LoadScene(2);
                    }
                }
            }
        }

	}
}
