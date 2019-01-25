using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class VolumeController : MonoBehaviour {
    public float volume;
    public Image volumeImage;
    public Sprite[] volumeOn;
    public Sprite volumeMute;
    bool mute;
	// Use this for initialization
	void Start () {
        volume = 1;
	}
	
	// Update is called once per frame
	void Update () {
        if (mute)
        {
            AudioListener.volume = 0;
            volumeImage.sprite = volumeMute;
        }
        else
        {
            AudioListener.volume = volume;
            if(volume < 0.33f)
            {
                volumeImage.sprite = volumeOn[0];
            }
            else if(volume < 0.66f)
            {
                volumeImage.sprite = volumeOn[1];
            }
            else
            {
                volumeImage.sprite = volumeOn[2];
            }
        }
        if (Input.GetKeyDown(KeyCode.M))
        {
            mute = !mute;
        }
	}
}
