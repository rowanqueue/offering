using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AudioManager : MonoBehaviour {
    public static AudioManager me;
    public GameObject audioPrefab;
    public AudioSource[] sounds;
	// Use this for initialization
	void Awake () {
        me = this;
        sounds = new AudioSource[32];
        for(int i = 0; i < sounds.Length; i++)
        {
            GameObject obj = Instantiate(audioPrefab, transform);
            sounds[i] = obj.GetComponent<AudioSource>();
        }
	}
    private void Update()
    {
        for(int i = 0; i < sounds.Length; i++)
        {
            AudioSource audio = sounds[i];
            if (audio.isPlaying)
            {
                audio.volume -= 0.10f;
            }
        }
    }
    public void PlaySound(AudioClip clip)
    {
        for(int i = 0; i< sounds.Length; i++)
        {
            AudioSource audio = sounds[i];
            if (audio.isPlaying)
            {
                continue;
            }
            audio.clip = clip;
            audio.Play();
            audio.volume = 1;
            break;
        }
    }
}
