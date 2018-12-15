using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class Credits : MonoBehaviour {
    public TMP_Text displayText;
    public float lerpTime;//time it takes to lerp in and out
    public float stayTime;//time text stays up
    public int state;//0lerpingin,1staying,1lerpingout
    public string[] textToDisplay;
    float duration;
    int index;
	// Use this for initialization
	void Start () {
        textToDisplay = new string[] { "<b>Lead Writer</b><size=35>\nSpencer Bernstein</size>\n\n<b>Additional Writing</b><size=35>\nParker Crandell, McKenna Flanagan, Ajali Harrison, Rowan Q</size>",
            "<b>Lead Programmer</b><size=35>\nRowan Q</size>\n\n<b>Additional Programming</b><size=35>\nParker Crandell</size>",
            "<b>Lead Puzzle Designer</b><size=35>\nParker Crandell</size>\n\n<b>Additional Puzzle Design</b>\n<size=35>Spencer Bernstein, Rowan Q</size>",
            "<b>Lead Artist</b><size=35>\nAjali Harrison</size>\n\n<b>Additional Art</b><size=35>\nMcKenna Flanagan</size>",
            "<b>Lead Sound Designer</b><size=35>\nChristian Weinschenk</size>",
            "<b>Music</b><size=35>\nChristian Weinschenk & Spencer Bernstein</size>",
            "Everybody else!!"
 };
        displayText.text = textToDisplay[index];
	}
	
	// Update is called once per frame
	void Update () {
        duration += Time.deltaTime;
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
                }
            }
        }

	}
}
