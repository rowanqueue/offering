using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TextSound : MonoBehaviour {
    public static TextSound me;
    public AudioClip typeSound;
    public AudioSource source;
	// Use this for initialization
	void Awake () {
        me = this;
	}
    public void PlaySound(string speaker)
    {
        source.clip = typeSound;
        source.Play();
    }

}
