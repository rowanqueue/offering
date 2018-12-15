using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class StartMenu : MonoBehaviour {
    public TMP_Text scrampText;
    public TMP_Text offeringText;
    public float lerpTime;//time it takes to lerp in and out
    float duration;
    Color transparent = new Color(1, 1, 1, 0);
    // Use this for initialization
    void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
        duration += Time.deltaTime;
        if(duration < lerpTime)
        {
            scrampText.color = Color.Lerp(transparent, Color.white, duration / lerpTime);
        }else if(duration > lerpTime * 2)
        {
            scrampText.color = Color.Lerp(Color.white, transparent, (duration - lerpTime * 2) / lerpTime);
        }

        if(duration > lerpTime * 3)
        {
            offeringText.color = Color.Lerp(transparent, Color.white, (duration - lerpTime * 3) / lerpTime);
        }
        if(duration > lerpTime * 4)
        {
            if (Input.anyKeyDown)
            {
                Debug.Log("FUCK");
            }
        }
	}
}
